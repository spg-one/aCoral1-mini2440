#include "lwip/err.h"
#include "arch/cc.h"
#include "lwip/netif.h"
#include "lwip/udp.h"

struct netif net_if;
void httpd_thread(void *);
err_t tcpip_input(struct pbuf *p, struct netif *inp);
err_t ethernetif_init(struct netif *netif);
void tcpip_init(void (*initfunc)(void *), void *arg);
void ethernetif_input(void *arg);
void output();

void my_lwip_init(void)
{
   struct ip_addr ipaddr, netmask, gw;
   u8_t bTemp;

   tcpip_init(NULL, NULL);
   IP4_ADDR(&gw, 192, 168, 1, 1);
   IP4_ADDR(&ipaddr, 192, 168, 1, 177);
   IP4_ADDR(&netmask, 255, 255, 255, 0);
   netif_add(&net_if, &ipaddr, &netmask, &gw, NULL, ethernetif_init, tcpip_input);
   netif_set_default(&net_if);
   netif_set_up(&net_if);
}

void acoral_net_lwip_init()
{
   acoral_prints("\r\nacoral_net_lwip_init\r\m");
   my_lwip_init();
   //output();
   send_data();
   sys_thread_new("RecvData", ethernetif_input, &net_if, 512, ETH_RECV_TASK_PPIO);
}

void send_data(void)
{
   struct pbuf *q = NULL;
   const char *reply = "spg";
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

void output()
{
   acoral_u8 *frame_data = {
       0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
       0xbc, 0x46, 0x99, 0x8a, 0x67, 0x82,
       0x8, 0x0, 0x45, 0x0, 0x0, 0x8f,
       0xc8, 0x7b, 0x0, 0x0, 0x40, 0x11,
       0x2d, 0x92, 0xc0, 0xa8, 0x1, 0x1,
       0xc0, 0xa8, 0x1, 0xff, 0x4, 0x0,
       0x13, 0x89, 0x0, 0x7b, 0x30, 0x51,
       0x1, 0x1, 0xe, 0x0, 0xe1, 0x2b,
       0x83, 0xc7, 0x7, 0x7b, 0x0, 0x65,
       0x0, 0x0, 0x0, 0x6, 0x0, 0x9,
       0x54, 0x4c, 0x2d, 0x57, 0x52, 0x38,
       0x39, 0x30, 0x4e, 0x0, 0xb, 0x0,
       0x3, 0x31, 0x2e, 0x30, 0x0, 0x7,
       0x0, 0x1, 0x1, 0x0, 0x5, 0x0,
       0x11, 0x62, 0x63, 0x2d, 0x34, 0x36,
       0x2d, 0x39, 0x39, 0x2d, 0x38, 0x61,
       0x2d, 0x36, 0x37, 0x2d, 0x38, 0x32,
       0x0, 0x8, 0x0, 0xb, 0x31, 0x39,
       0x32, 0x2e, 0x31, 0x36, 0x38, 0x2e,
       0x31, 0x2e, 0x31, 0x0, 0x9, 0x0,
       0xa, 0x74, 0x70, 0x6c, 0x6f, 0x67,
       0x69, 0x6e, 0x2e, 0x63, 0x6e, 0x0,
       0xa, 0x0, 0xd, 0x54, 0x4c, 0x2d,
       0x57, 0x52, 0x38, 0x39, 0x30, 0x4e,
       0x20, 0x31, 0x2e, 0x30, 0x0, 0xc,
       0x0, 0x5, 0x31, 0x2e, 0x37, 0x2e,
       0x33, 0x17, 0xdf, 0x14, 0x50};
   struct pbuf *q = NULL;
   q = pbuf_alloc(PBUF_TRANSPORT, strlen(frame_data), PBUF_RAM);
   if (!q)
   {
      acoral_prints("out of PBUF_RAM\n");
      return;
   }
   memset(q->payload, 0, strlen(frame_data));

   memcpy(q->payload, frame_data, strlen(frame_data));
   q->tot_len = strlen(frame_data);
   q->next = NULL;
   q->len = strlen(frame_data);

   struct pbuf *u = NULL;
   int i;
   for (u = q; u != NULL; u = u->next)
   {
      int len = u->len;
      acoral_print("spg the packed len: %d <--->\r\n", len);
      u8_t *dat = (u8_t *)u->payload;
      for (i = 0; i < len; i++)
      {
         acoral_print("%4x ", dat[i]);
         if ((i % 6) == 5)
            acoral_print("\r\n");
      }
      acoral_print("\r\n<*<*<*>*>*>\r\n");
   }
   acoral_print("\r\n+++++++++++++++++++++\r\n");

   hw_sendPacket(q);
}
