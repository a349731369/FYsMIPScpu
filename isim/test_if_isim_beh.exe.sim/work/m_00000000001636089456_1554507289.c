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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/myCpu/FYsMIPScpu/InsMem.v";
static const char *ng1 = "E:\\myCpu\\FYsMIPScpu\\FY_test_int.txt";
static int ng2[] = {3, 0};
static int ng3[] = {7, 0};
static int ng4[] = {0, 0};
static int ng5[] = {2, 0};
static int ng6[] = {15, 0};
static int ng7[] = {8, 0};
static int ng8[] = {1, 0};
static int ng9[] = {23, 0};
static int ng10[] = {16, 0};
static int ng11[] = {31, 0};
static int ng12[] = {24, 0};



static void Initial_30_0(char *t0)
{
    char *t1;

LAB0:    xsi_set_current_line(31, ng0);

LAB2:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1768);
    xsi_vlogfile_readmemh(ng1, 0, t1, 0, 0, 0, 0);

LAB1:    return;
}

static void Always_35_1(char *t0)
{
    char t14[8];
    char t23[8];
    char t25[8];
    char t26[8];
    char t27[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    int t35;
    char *t36;
    unsigned int t37;
    int t38;
    int t39;
    char *t40;
    unsigned int t41;
    int t42;
    int t43;
    unsigned int t44;
    int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    int t49;

LAB0:    t1 = (t0 + 2936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 3256);
    *((int *)t2) = 1;
    t3 = (t0 + 2968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(36, ng0);

LAB5:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(39, ng0);

LAB9:    xsi_set_current_line(40, ng0);
    t11 = (t0 + 1768);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t0 + 1768);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 1768);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t21 = (t0 + 1048U);
    t22 = *((char **)t21);
    t21 = ((char*)((ng2)));
    memset(t23, 0, 8);
    xsi_vlog_unsigned_add(t23, 32, t22, 32, t21, 32);
    xsi_vlog_generic_get_array_select_value(t14, 8, t13, t17, t20, 2, 1, t23, 32, 2);
    t24 = (t0 + 1608);
    t28 = (t0 + 1608);
    t29 = (t28 + 72U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng3)));
    t32 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t25, t26, t27, ((int*)(t30)), 2, t31, 32, 1, t32, 32, 1);
    t33 = (t25 + 4);
    t34 = *((unsigned int *)t33);
    t35 = (!(t34));
    t36 = (t26 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (!(t37));
    t39 = (t35 && t38);
    t40 = (t27 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (!(t41));
    t43 = (t39 && t42);
    if (t43 == 1)
        goto LAB10;

LAB11:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1768);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t13 = (t0 + 1768);
    t15 = (t13 + 64U);
    t16 = *((char **)t15);
    t17 = (t0 + 1048U);
    t18 = *((char **)t17);
    t17 = ((char*)((ng5)));
    memset(t23, 0, 8);
    xsi_vlog_unsigned_add(t23, 32, t18, 32, t17, 32);
    xsi_vlog_generic_get_array_select_value(t14, 8, t4, t12, t16, 2, 1, t23, 32, 2);
    t19 = (t0 + 1608);
    t20 = (t0 + 1608);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t24 = ((char*)((ng6)));
    t28 = ((char*)((ng7)));
    xsi_vlog_convert_partindices(t25, t26, t27, ((int*)(t22)), 2, t24, 32, 1, t28, 32, 1);
    t29 = (t25 + 4);
    t6 = *((unsigned int *)t29);
    t35 = (!(t6));
    t30 = (t26 + 4);
    t7 = *((unsigned int *)t30);
    t38 = (!(t7));
    t39 = (t35 && t38);
    t31 = (t27 + 4);
    t8 = *((unsigned int *)t31);
    t42 = (!(t8));
    t43 = (t39 && t42);
    if (t43 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1768);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t13 = (t0 + 1768);
    t15 = (t13 + 64U);
    t16 = *((char **)t15);
    t17 = (t0 + 1048U);
    t18 = *((char **)t17);
    t17 = ((char*)((ng8)));
    memset(t23, 0, 8);
    xsi_vlog_unsigned_add(t23, 32, t18, 32, t17, 32);
    xsi_vlog_generic_get_array_select_value(t14, 8, t4, t12, t16, 2, 1, t23, 32, 2);
    t19 = (t0 + 1608);
    t20 = (t0 + 1608);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t24 = ((char*)((ng9)));
    t28 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t25, t26, t27, ((int*)(t22)), 2, t24, 32, 1, t28, 32, 1);
    t29 = (t25 + 4);
    t6 = *((unsigned int *)t29);
    t35 = (!(t6));
    t30 = (t26 + 4);
    t7 = *((unsigned int *)t30);
    t38 = (!(t7));
    t39 = (t35 && t38);
    t31 = (t27 + 4);
    t8 = *((unsigned int *)t31);
    t42 = (!(t8));
    t43 = (t39 && t42);
    if (t43 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1768);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t13 = (t0 + 1768);
    t15 = (t13 + 64U);
    t16 = *((char **)t15);
    t17 = (t0 + 1048U);
    t18 = *((char **)t17);
    xsi_vlog_generic_get_array_select_value(t14, 8, t4, t12, t16, 2, 1, t18, 32, 2);
    t17 = (t0 + 1608);
    t19 = (t0 + 1608);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng11)));
    t24 = ((char*)((ng12)));
    xsi_vlog_convert_partindices(t23, t25, t26, ((int*)(t21)), 2, t22, 32, 1, t24, 32, 1);
    t28 = (t23 + 4);
    t6 = *((unsigned int *)t28);
    t35 = (!(t6));
    t29 = (t25 + 4);
    t7 = *((unsigned int *)t29);
    t38 = (!(t7));
    t39 = (t35 && t38);
    t30 = (t26 + 4);
    t8 = *((unsigned int *)t30);
    t42 = (!(t8));
    t43 = (t39 && t42);
    if (t43 == 1)
        goto LAB16;

LAB17:    goto LAB8;

LAB10:    t44 = *((unsigned int *)t27);
    t45 = (t44 + 0);
    t46 = *((unsigned int *)t25);
    t47 = *((unsigned int *)t26);
    t48 = (t46 - t47);
    t49 = (t48 + 1);
    xsi_vlogvar_assign_value(t24, t14, t45, *((unsigned int *)t26), t49);
    goto LAB11;

LAB12:    t9 = *((unsigned int *)t27);
    t45 = (t9 + 0);
    t10 = *((unsigned int *)t25);
    t34 = *((unsigned int *)t26);
    t48 = (t10 - t34);
    t49 = (t48 + 1);
    xsi_vlogvar_assign_value(t19, t14, t45, *((unsigned int *)t26), t49);
    goto LAB13;

LAB14:    t9 = *((unsigned int *)t27);
    t45 = (t9 + 0);
    t10 = *((unsigned int *)t25);
    t34 = *((unsigned int *)t26);
    t48 = (t10 - t34);
    t49 = (t48 + 1);
    xsi_vlogvar_assign_value(t19, t14, t45, *((unsigned int *)t26), t49);
    goto LAB15;

LAB16:    t9 = *((unsigned int *)t26);
    t45 = (t9 + 0);
    t10 = *((unsigned int *)t23);
    t34 = *((unsigned int *)t25);
    t48 = (t10 - t34);
    t49 = (t48 + 1);
    xsi_vlogvar_assign_value(t17, t14, t45, *((unsigned int *)t25), t49);
    goto LAB17;

}


extern void work_m_00000000001636089456_1554507289_init()
{
	static char *pe[] = {(void *)Initial_30_0,(void *)Always_35_1};
	xsi_register_didat("work_m_00000000001636089456_1554507289", "isim/test_if_isim_beh.exe.sim/work/m_00000000001636089456_1554507289.didat");
	xsi_register_executes(pe);
}
