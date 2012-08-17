/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Administrator/Documents/GitHub/lissajous/test/VGA_test/vga_controller.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2094737297_1181938964_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    int t9;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5912);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 6072);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t2 = (t8 == 1);
    if (t2 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t9 = (t8 + 1);
    t1 = (t0 + 6136);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t9;
    xsi_driver_first_trans_fast(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 6072);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 6136);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((int *)t6) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

}

static void work_a_2094737297_1181938964_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    unsigned char t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2112U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5928);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t5 = *((int *)t4);
    t6 = (t5 == 800);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t2 = (t5 == 521);
    if (t2 != 0)
        goto LAB8;

LAB9:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t11 = (t5 + 1);
    t1 = (t0 + 6200);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t1);

LAB6:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t6 = (t5 < 640);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = (unsigned char)0;

LAB15:    if (t2 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 10484);
    t4 = (t0 + 6328);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 10487);
    t4 = (t0 + 6392);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 10490);
    t4 = (t0 + 6456);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB11:    goto LAB3;

LAB5:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 6200);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((int *)t10) = 0;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t11 = (t5 + 1);
    t1 = (t0 + 6264);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = t11;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB8:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 6200);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((int *)t9) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 6264);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB10:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2952U);
    t7 = *((char **)t1);
    t13 = (7 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t7 + t15);
    t8 = (t0 + 6328);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 3U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t13 = (7 - 4);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t3 + t15);
    t4 = (t0 + 6392);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t13 = (7 - 1);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t3 + t15);
    t4 = (t0 + 6456);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB11;

LAB13:    t1 = (t0 + 2472U);
    t4 = *((char **)t1);
    t11 = *((int *)t4);
    t12 = (t11 < 480);
    t2 = t12;
    goto LAB15;

}

static void work_a_2094737297_1181938964_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(97, ng0);

LAB3:    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t1, t4, 10);
    t5 = (t0 + 6520);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 10U);
    xsi_driver_first_trans_fast(t5);

LAB2:    t10 = (t0 + 5944);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2094737297_1181938964_p_3(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(98, ng0);

LAB3:    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t1, t4, 10);
    t5 = (t0 + 6584);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 10U);
    xsi_driver_first_trans_fast(t5);

LAB2:    t10 = (t0 + 5960);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2094737297_1181938964_p_4(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned char t5;
    char *t6;
    int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t5 = (t4 > 703);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t13 = (t0 + 6648);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 5976);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 6648);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB2;

LAB5:    t2 = (t0 + 2312U);
    t6 = *((char **)t2);
    t7 = *((int *)t6);
    t8 = (t7 < 800);
    t1 = t8;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_2094737297_1181938964_p_5(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned char t5;
    char *t6;
    int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t5 = (t4 > 517);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t13 = (t0 + 6712);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 5992);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t2 = (t0 + 6712);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB2;

LAB5:    t2 = (t0 + 2472U);
    t6 = *((char **)t2);
    t7 = *((int *)t6);
    t8 = (t7 < 521);
    t1 = t8;
    goto LAB7;

LAB9:    goto LAB2;

}


extern void work_a_2094737297_1181938964_init()
{
	static char *pe[] = {(void *)work_a_2094737297_1181938964_p_0,(void *)work_a_2094737297_1181938964_p_1,(void *)work_a_2094737297_1181938964_p_2,(void *)work_a_2094737297_1181938964_p_3,(void *)work_a_2094737297_1181938964_p_4,(void *)work_a_2094737297_1181938964_p_5};
	xsi_register_didat("work_a_2094737297_1181938964", "isim/timing_test_isim_beh.exe.sim/work/a_2094737297_1181938964.didat");
	xsi_register_executes(pe);
}
