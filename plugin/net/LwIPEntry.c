#include "lwip/err.h"
#include "arch/cc.h"
#include "lwip/netif.h"
#include "lwip/udp.h"
#include "lwip/sys.h"

struct netif net_if;
void httpd_thread(void *);
err_t tcpip_input(struct pbuf *p, struct netif *inp);
err_t ethernetif_init(struct netif *netif);
void tcpip_init(void (*initfunc)(void *), void *arg);
void ethernetif_input(void *arg);
void output(void);
void send_data(void);

void my_lwip_init(void)
{
   struct ip_addr ipaddr, netmask, gw;

   tcpip_init(NULL, NULL);
   IP4_ADDR(&gw, 192, 168, 1, 1);
   IP4_ADDR(&ipaddr, 192, 168, 1, 177);
   IP4_ADDR(&netmask, 255, 255, 255, 0);
   netif_add(&net_if, &ipaddr, &netmask, &gw, NULL, ethernetif_init, tcpip_input);
   netif_set_default(&net_if);
   netif_set_up(&net_if);
}

void acoral_net_lwip_init(void)
{
   acoral_prints("\r\nacoral_net_lwip_init\r\n");
   my_lwip_init();
   send_data();
   sys_thread_new("RecvData", ethernetif_input, &net_if, 512, ETH_RECV_TASK_PPIO);
}

void send_data(void)
{
   struct pbuf *q = NULL;
   const char *reply = "spggogogo";
   struct udp_pcb *upcb;
   struct ip_addr addr;
   IP4_ADDR(&addr, 255, 255, 255, 255);

   upcb = udp_new();
   udp_bind(upcb, IP_ADDR_ANY, 0);

   q = pbuf_alloc(PBUF_TRANSPORT, strlen(reply) + 1, PBUF_RAM);
   if (!q)
   {
      acoral_prints("out of PBUF_RAM\n");
      return;
   }
   memset(q->payload, 0, q->len);
   memcpy(q->payload, reply, strlen(reply));
   acoral_prints(q->payload);
   udp_sendto(upcb, q, &addr, 53169);
   pbuf_free(q);
   acoral_prints("udp send to router done!\n");
}