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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000863108283_3383896982_init();
    work_m_00000000001046833333_0582474567_init();
    work_m_00000000001636089456_1554507289_init();
    work_m_00000000003448093236_2531829270_init();
    work_m_00000000002145481292_2352116331_init();
    work_m_00000000000032848283_2828567685_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000032848283_2828567685");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
