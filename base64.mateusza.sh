#!/bin/sh

# taken from  https://github.com/mateusza/shellscripthttpd/blob/master/base64.sh

# fallback base64 implementation
# works with busybox

encode(){

    hexdump -v -e '2/1 "%02x"' | \
        sed -e 's/0/0000 /g;s/1/0001 /g;s/2/0010 /g;s/3/0011 /g;
                s/4/0100 /g;s/5/0101 /g;s/6/0110 /g;s/7/0111 /g;
                s/8/1000 /g;s/9/1001 /g;s/a/1010 /g;s/b/1011 /g;
                s/c/1100 /g;s/d/1101 /g;s/e/1110 /g;s/f/1111 /g;' | \
        tr -d ' ' | \
        sed -e 's/[01]\{6\}/\0 /g' | \
        sed -e 's_000000_A_g; s_000001_B_g; s_000010_C_g; s_000011_D_g;
                s_000100_E_g; s_000101_F_g; s_000110_G_g; s_000111_H_g;
                s_001000_I_g; s_001001_J_g; s_001010_K_g; s_001011_L_g;
                s_001100_M_g; s_001101_N_g; s_001110_O_g; s_001111_P_g;
                s_010000_Q_g; s_010001_R_g; s_010010_S_g; s_010011_T_g;
                s_010100_U_g; s_010101_V_g; s_010110_W_g; s_010111_X_g;
                s_011000_Y_g; s_011001_Z_g; s_011010_a_g; s_011011_b_g;
                s_011100_c_g; s_011101_d_g; s_011110_e_g; s_011111_f_g;
                s_100000_g_g; s_100001_h_g; s_100010_i_g; s_100011_j_g;
                s_100100_k_g; s_100101_l_g; s_100110_m_g; s_100111_n_g;
                s_101000_o_g; s_101001_p_g; s_101010_q_g; s_101011_r_g;
                s_101100_s_g; s_101101_t_g; s_101110_u_g; s_101111_v_g;
                s_110000_w_g; s_110001_x_g; s_110010_y_g; s_110011_z_g;
                s_110100_0_g; s_110101_1_g; s_110110_2_g; s_110111_3_g;
                s_111000_4_g; s_111001_5_g; s_111010_6_g; s_111011_7_g;
                s_111100_8_g; s_111101_9_g; s_111110_+_g; s_111111_/_g;

                s_0000_A=_g;  s_0001_E=_g;  s_0010_I=_g;  s_0011_M=_g;
                s_0100_Q=_g;  s_0101_U=_g;  s_0110_Y=_g;  s_0111_c=_g;
                s_1000_g=_g;  s_1001_k=_g;  s_1010_o=_g;  s_1011_s=_g;
                s_1100_w=_g;  s_1101_0=_g;  s_1110_4=_g;  s_1111_8=_g;

                s_00_A==_;    s_01_Q==_;    s_10_g==_;    s_11_w==_;
                ' | \
                tr -d ' ' | \
                sed -e 's/.\{64\}/\0\n/g'
        echo
}

decode(){
 
/usr/bin/printf "$(
tr -d '\n' | \
sed -e '               
        s_A==_@@_;    s_Q==_@,_;    s_g==_,@_;    s_w==_,,_;

        s_A=_@@@@_;  s_E=_@@@,_;  s_I=_@@,@_;  s_M=_@@,,_;
        s_Q=_@,@@_;  s_U=_@,@,_;  s_Y=_@,,@_;  s_c=_@,,,_;
        s_g=_,@@@_;  s_k=_,@@,_;  s_o=_,@,@_;  s_s=_,@,,_;
        s_w=_,,@@_;  s_@=_,,@,_;  s_4=_,,,@_;  s_8=_,,,,_;

        s_A_@@@@@@_g; s_B_@@@@@,_g; s_C_@@@@,@_g; s_D_@@@@,,_g;
        s_E_@@@,@@_g; s_F_@@@,@,_g; s_G_@@@,,@_g; s_H_@@@,,,_g;
        s_I_@@,@@@_g; s_J_@@,@@,_g; s_K_@@,@,@_g; s_L_@@,@,,_g;
        s_M_@@,,@@_g; s_N_@@,,@,_g; s_O_@@,,,@_g; s_P_@@,,,,_g;
        s_Q_@,@@@@_g; s_R_@,@@@,_g; s_S_@,@@,@_g; s_T_@,@@,,_g;
        s_U_@,@,@@_g; s_V_@,@,@,_g; s_W_@,@,,@_g; s_X_@,@,,,_g;
        s_Y_@,,@@@_g; s_Z_@,,@@,_g; s_a_@,,@,@_g; s_b_@,,@,,_g;
        s_c_@,,,@@_g; s_d_@,,,@,_g; s_e_@,,,,@_g; s_f_@,,,,,_g;
        s_g_,@@@@@_g; s_h_,@@@@,_g; s_i_,@@@,@_g; s_j_,@@@,,_g;
        s_k_,@@,@@_g; s_l_,@@,@,_g; s_m_,@@,,@_g; s_n_,@@,,,_g;
        s_o_,@,@@@_g; s_p_,@,@@,_g; s_q_,@,@,@_g; s_r_,@,@,,_g;
        s_s_,@,,@@_g; s_t_,@,,@,_g; s_u_,@,,,@_g; s_v_,@,,,,_g;
        s_w_,,@@@@_g; s_x_,,@@@,_g; s_y_,,@@,@_g; s_z_,,@@,,_g;
        s_0_,,@,@@_g; s_1_,,@,@,_g; s_2_,,@,,@_g; s_3_,,@,,,_g;
        s_4_,,,@@@_g; s_5_,,,@@,_g; s_6_,,,@,@_g; s_7_,,,@,,_g;
        s_8_,,,,@@_g; s_9_,,,,@,_g; s_+_,,,,,@_g; s_/_,,,,,,_g;
        ' | \
    sed -e 's/[,@]\{4\}/\0 /g' | \
    sed -e 's/@@@@/0/g; s/@@@,/1/g; s/@@,@/2/g; s/@@,,/3/g;
            s/@,@@/4/g; s/@,@,/5/g; s/@,,@/6/g; s/@,,,/7/g;
            s/,@@@/8/g; s/,@@,/9/g; s/,@,@/a/g; s/,@,,/b/g;
            s/,,@@/c/g; s/,,@,/d/g; s/,,,@/e/g; s/,,,,/f/g;' | \
    tr -d ' ' | \
    sed -e 's/../\\x\0/g'
    )"
}

if [ "x$1" = "x-h" ]
then
    echo "usage: $0 [-d]"
    exit
fi

if [ "x$1" = "x-d" ]
then
    decode
else
    encode
fi
