/*   LAPACK Fortran77 Header File
 *   included by all the lapack wrapper functions lapack_*.c
 *   Written by Remi Delmas
 */

#ifndef LAPACK_F77_H
#define LAPACK_F77_H

#if defined(ADD_)
	#define f77_cbdsqr cbdsqr_
	#define f77_cgbbrd cgbbrd_
	#define f77_cgbcon cgbcon_
	#define f77_cgbequ cgbequ_
	#define f77_cgbrfs cgbrfs_
	#define f77_cgbsv cgbsv_
	#define f77_cgbsvx cgbsvx_
	#define f77_cgbtf2 cgbtf2_
	#define f77_cgbtrf cgbtrf_
	#define f77_cgbtrs cgbtrs_
	#define f77_cgebak cgebak_
	#define f77_cgebal cgebal_
	#define f77_cgebd2 cgebd2_
	#define f77_cgebrd cgebrd_
	#define f77_cgecon cgecon_
	#define f77_cgeequ cgeequ_
	#define f77_cgees cgees_
	#define f77_cgeesx cgeesx_
	#define f77_cgeev cgeev_
	#define f77_cgeevx cgeevx_
	#define f77_cgegs cgegs_
	#define f77_cgegv cgegv_
	#define f77_cgehd2 cgehd2_
	#define f77_cgehrd cgehrd_
	#define f77_cgelq2 cgelq2_
	#define f77_cgelqf cgelqf_
	#define f77_cgels cgels_
	#define f77_cgelsd cgelsd_
	#define f77_cgelss cgelss_
	#define f77_cgelsx cgelsx_
	#define f77_cgelsy cgelsy_
	#define f77_cgeql2 cgeql2_
	#define f77_cgeqlf cgeqlf_
	#define f77_cgeqp3 cgeqp3_
	#define f77_cgeqpf cgeqpf_
	#define f77_cgeqr2 cgeqr2_
	#define f77_cgeqrf cgeqrf_
	#define f77_cgerfs cgerfs_
	#define f77_cgerq2 cgerq2_
	#define f77_cgerqf cgerqf_
	#define f77_cgesc2 cgesc2_
	#define f77_cgesdd cgesdd_
	#define f77_cgesv cgesv_
	#define f77_cgesvd cgesvd_
	#define f77_cgesvx cgesvx_
	#define f77_cgetc2 cgetc2_
	#define f77_cgetf2 cgetf2_
	#define f77_cgetrf cgetrf_
	#define f77_cgetri cgetri_
	#define f77_cgetrs cgetrs_
	#define f77_cggbak cggbak_
	#define f77_cggbal cggbal_
	#define f77_cgges cgges_
	#define f77_cggesx cggesx_
	#define f77_cggev cggev_
	#define f77_cggevx cggevx_
	#define f77_cggglm cggglm_
	#define f77_cgghrd cgghrd_
	#define f77_cgglse cgglse_
	#define f77_cggqrf cggqrf_
	#define f77_cggrqf cggrqf_
	#define f77_cggsvd cggsvd_
	#define f77_cggsvp cggsvp_
	#define f77_cgtcon cgtcon_
	#define f77_cgtrfs cgtrfs_
	#define f77_cgtsv cgtsv_
	#define f77_cgtsvx cgtsvx_
	#define f77_cgttrf cgttrf_
	#define f77_cgttrs cgttrs_
	#define f77_cgtts2 cgtts2_
	#define f77_chbev chbev_
	#define f77_chbevd chbevd_
	#define f77_chbevx chbevx_
	#define f77_chbgst chbgst_
	#define f77_chbgv chbgv_
	#define f77_chbgvd chbgvd_
	#define f77_chbgvx chbgvx_
	#define f77_chbtrd chbtrd_
	#define f77_checon checon_
	#define f77_cheev cheev_
	#define f77_cheevd cheevd_
	#define f77_cheevr cheevr_
	#define f77_cheevx cheevx_
	#define f77_chegs2 chegs2_
	#define f77_chegst chegst_
	#define f77_chegv chegv_
	#define f77_chegvd chegvd_
	#define f77_chegvx chegvx_
	#define f77_cherfs cherfs_
	#define f77_chesv chesv_
	#define f77_chesvx chesvx_
	#define f77_chetd2 chetd2_
	#define f77_chetf2 chetf2_
	#define f77_chetrd chetrd_
	#define f77_chetrf chetrf_
	#define f77_chetri chetri_
	#define f77_chetrs chetrs_
	#define f77_chgeqz chgeqz_
	#define f77_chpcon chpcon_
	#define f77_chpev chpev_
	#define f77_chpevd chpevd_
	#define f77_chpevx chpevx_
	#define f77_chpgst chpgst_
	#define f77_chpgv chpgv_
	#define f77_chpgvd chpgvd_
	#define f77_chpgvx chpgvx_
	#define f77_chprfs chprfs_
	#define f77_chpsv chpsv_
	#define f77_chpsvx chpsvx_
	#define f77_chptrd chptrd_
	#define f77_chptrf chptrf_
	#define f77_chptri chptri_
	#define f77_chptrs chptrs_
	#define f77_chsein chsein_
	#define f77_chseqr chseqr_
	#define f77_clabrd clabrd_
	#define f77_clacgv clacgv_
	#define f77_clacn2 clacn2_
	#define f77_clacon clacon_
	#define f77_clacp2 clacp2_
	#define f77_clacpy clacpy_
	#define f77_clacrm clacrm_
	#define f77_clacrt clacrt_
	#define f77_cladiv cladivsub_
	#define f77_claed0 claed0_
	#define f77_claed7 claed7_
	#define f77_claed8 claed8_
	#define f77_claein claein_
	#define f77_claesy claesy_
	#define f77_claev2 claev2_
	#define f77_clags2 clags2_
	#define f77_clagtm clagtm_
	#define f77_clahef clahef_
	#define f77_clahqr clahqr_
	#define f77_clahrd clahrd_
	#define f77_claic1 claic1_
	#define f77_clals0 clals0_
	#define f77_clalsa clalsa_
	#define f77_clalsd clalsd_
	#define f77_clangb clangbsub_
	#define f77_clange clangesub_
	#define f77_clangt clangtsub_
	#define f77_clanhb clanhbsub_
	#define f77_clanhe clanhesub_
	#define f77_clanhp clanhpsub_
	#define f77_clanhs clanhssub_
	#define f77_clanht clanhtsub_
	#define f77_clansb clansbsub_
	#define f77_clansp clanspsub_
	#define f77_clansy clansysub_
	#define f77_clantb clantbsub_
	#define f77_clantp clantpsub_
	#define f77_clantr clantrsub_
	#define f77_clapll clapll_
	#define f77_clapmt clapmt_
	#define f77_claqgb claqgb_
	#define f77_claqge claqge_
	#define f77_claqhb claqhb_
	#define f77_claqhe claqhe_
	#define f77_claqhp claqhp_
	#define f77_claqp2 claqp2_
	#define f77_claqps claqps_
	#define f77_claqsb claqsb_
	#define f77_claqsp claqsp_
	#define f77_claqsy claqsy_
	#define f77_clar1v clar1v_
	#define f77_clar2v clar2v_
	#define f77_clarcm clarcm_
	#define f77_clarf clarf_
	#define f77_clarfb clarfb_
	#define f77_clarfg clarfg_
	#define f77_clarft clarft_
	#define f77_clarfx clarfx_
	#define f77_clargv clargv_
	#define f77_clarnv clarnv_
	#define f77_clarrv clarrv_
	#define f77_clartg clartg_
	#define f77_clartv clartv_
	#define f77_clarz clarz_
	#define f77_clarzb clarzb_
	#define f77_clarzt clarzt_
	#define f77_clascl clascl_
	#define f77_claset claset_
	#define f77_clasr clasr_
	#define f77_classq classq_
	#define f77_claswp claswp_
	#define f77_clasyf clasyf_
	#define f77_clatbs clatbs_
	#define f77_clatdf clatdf_
	#define f77_clatps clatps_
	#define f77_clatrd clatrd_
	#define f77_clatrs clatrs_
	#define f77_clatrz clatrz_
	#define f77_clatzm clatzm_
	#define f77_clauu2 clauu2_
	#define f77_clauum clauum_
	#define f77_cpbcon cpbcon_
	#define f77_cpbequ cpbequ_
	#define f77_cpbrfs cpbrfs_
	#define f77_cpbstf cpbstf_
	#define f77_cpbsv cpbsv_
	#define f77_cpbsvx cpbsvx_
	#define f77_cpbtf2 cpbtf2_
	#define f77_cpbtrf cpbtrf_
	#define f77_cpbtrs cpbtrs_
	#define f77_cpocon cpocon_
	#define f77_cpoequ cpoequ_
	#define f77_cporfs cporfs_
	#define f77_cposv cposv_
	#define f77_cposvx cposvx_
	#define f77_cpotf2 cpotf2_
	#define f77_cpotrf cpotrf_
	#define f77_cpotri cpotri_
	#define f77_cpotrs cpotrs_
	#define f77_cppcon cppcon_
	#define f77_cppequ cppequ_
	#define f77_cpprfs cpprfs_
	#define f77_cppsv cppsv_
	#define f77_cppsvx cppsvx_
	#define f77_cpptrf cpptrf_
	#define f77_cpptri cpptri_
	#define f77_cpptrs cpptrs_
	#define f77_cptcon cptcon_
	#define f77_cpteqr cpteqr_
	#define f77_cptrfs cptrfs_
	#define f77_cptsv cptsv_
	#define f77_cptsvx cptsvx_
	#define f77_cpttrf cpttrf_
	#define f77_cpttrs cpttrs_
	#define f77_cptts2 cptts2_
	#define f77_crot crot_
	#define f77_cspcon cspcon_
	#define f77_cspmv cspmv_
	#define f77_cspr cspr_
	#define f77_csprfs csprfs_
	#define f77_cspsv cspsv_
	#define f77_cspsvx cspsvx_
	#define f77_csptrf csptrf_
	#define f77_csptri csptri_
	#define f77_csptrs csptrs_
	#define f77_csrot csrot_
	#define f77_csrscl csrscl_
	#define f77_cstedc cstedc_
	#define f77_cstegr cstegr_
	#define f77_cstein cstein_
	#define f77_csteqr csteqr_
	#define f77_csycon csycon_
	#define f77_csymv csymv_
	#define f77_csyr csyr_
	#define f77_csyrfs csyrfs_
	#define f77_csysv csysv_
	#define f77_csysvx csysvx_
	#define f77_csytf2 csytf2_
	#define f77_csytrf csytrf_
	#define f77_csytri csytri_
	#define f77_csytrs csytrs_
	#define f77_ctbcon ctbcon_
	#define f77_ctbrfs ctbrfs_
	#define f77_ctbtrs ctbtrs_
	#define f77_ctgevc ctgevc_
	#define f77_ctgex2 ctgex2_
	#define f77_ctgexc ctgexc_
	#define f77_ctgsen ctgsen_
	#define f77_ctgsja ctgsja_
	#define f77_ctgsna ctgsna_
	#define f77_ctgsy2 ctgsy2_
	#define f77_ctgsyl ctgsyl_
	#define f77_ctpcon ctpcon_
	#define f77_ctprfs ctprfs_
	#define f77_ctptri ctptri_
	#define f77_ctptrs ctptrs_
	#define f77_ctrcon ctrcon_
	#define f77_ctrevc ctrevc_
	#define f77_ctrexc ctrexc_
	#define f77_ctrrfs ctrrfs_
	#define f77_ctrsen ctrsen_
	#define f77_ctrsna ctrsna_
	#define f77_ctrsyl ctrsyl_
	#define f77_ctrti2 ctrti2_
	#define f77_ctrtri ctrtri_
	#define f77_ctrtrs ctrtrs_
	#define f77_ctzrqf ctzrqf_
	#define f77_ctzrzf ctzrzf_
	#define f77_cung2l cung2l_
	#define f77_cung2r cung2r_
	#define f77_cungbr cungbr_
	#define f77_cunghr cunghr_
	#define f77_cungl2 cungl2_
	#define f77_cunglq cunglq_
	#define f77_cungql cungql_
	#define f77_cungqr cungqr_
	#define f77_cungr2 cungr2_
	#define f77_cungrq cungrq_
	#define f77_cungtr cungtr_
	#define f77_cunm2l cunm2l_
	#define f77_cunm2r cunm2r_
	#define f77_cunmbr cunmbr_
	#define f77_cunmhr cunmhr_
	#define f77_cunml2 cunml2_
	#define f77_cunmlq cunmlq_
	#define f77_cunmql cunmql_
	#define f77_cunmqr cunmqr_
	#define f77_cunmr2 cunmr2_
	#define f77_cunmr3 cunmr3_
	#define f77_cunmrq cunmrq_
	#define f77_cunmrz cunmrz_
	#define f77_cunmtr cunmtr_
	#define f77_cupgtr cupgtr_
	#define f77_cupmtr cupmtr_
	#define f77_dbdsdc dbdsdc_
	#define f77_dbdsqr dbdsqr_
	#define f77_ddisna ddisna_
	#define f77_dgbbrd dgbbrd_
	#define f77_dgbcon dgbcon_
	#define f77_dgbequ dgbequ_
	#define f77_dgbrfs dgbrfs_
	#define f77_dgbsv dgbsv_
	#define f77_dgbsvx dgbsvx_
	#define f77_dgbtf2 dgbtf2_
	#define f77_dgbtrf dgbtrf_
	#define f77_dgbtrs dgbtrs_
	#define f77_dgebak dgebak_
	#define f77_dgebal dgebal_
	#define f77_dgebd2 dgebd2_
	#define f77_dgebrd dgebrd_
	#define f77_dgecon dgecon_
	#define f77_dgeequ dgeequ_
	#define f77_dgees dgees_
	#define f77_dgeesx dgeesx_
	#define f77_dgeev dgeev_
	#define f77_dgeevx dgeevx_
	#define f77_dgegs dgegs_
	#define f77_dgegv dgegv_
	#define f77_dgehd2 dgehd2_
	#define f77_dgehrd dgehrd_
	#define f77_dgelq2 dgelq2_
	#define f77_dgelqf dgelqf_
	#define f77_dgels dgels_
	#define f77_dgelsd dgelsd_
	#define f77_dgelss dgelss_
	#define f77_dgelsx dgelsx_
	#define f77_dgelsy dgelsy_
	#define f77_dgeql2 dgeql2_
	#define f77_dgeqlf dgeqlf_
	#define f77_dgeqp3 dgeqp3_
	#define f77_dgeqpf dgeqpf_
	#define f77_dgeqr2 dgeqr2_
	#define f77_dgeqrf dgeqrf_
	#define f77_dgerfs dgerfs_
	#define f77_dgerq2 dgerq2_
	#define f77_dgerqf dgerqf_
	#define f77_dgesc2 dgesc2_
	#define f77_dgesdd dgesdd_
	#define f77_dgesv dgesv_
	#define f77_dgesvd dgesvd_
	#define f77_dgesvx dgesvx_
	#define f77_dgetc2 dgetc2_
	#define f77_dgetf2 dgetf2_
	#define f77_dgetrf dgetrf_
	#define f77_dgetri dgetri_
	#define f77_dgetrs dgetrs_
	#define f77_dggbak dggbak_
	#define f77_dggbal dggbal_
	#define f77_dgges dgges_
	#define f77_dggesx dggesx_
	#define f77_dggev dggev_
	#define f77_dggevx dggevx_
	#define f77_dggglm dggglm_
	#define f77_dgghrd dgghrd_
	#define f77_dgglse dgglse_
	#define f77_dggqrf dggqrf_
	#define f77_dggrqf dggrqf_
	#define f77_dggsvd dggsvd_
	#define f77_dggsvp dggsvp_
	#define f77_dgtcon dgtcon_
	#define f77_dgtrfs dgtrfs_
	#define f77_dgtsv dgtsv_
	#define f77_dgtsvx dgtsvx_
	#define f77_dgttrf dgttrf_
	#define f77_dgttrs dgttrs_
	#define f77_dgtts2 dgtts2_
	#define f77_dhgeqz dhgeqz_
	#define f77_dhsein dhsein_
	#define f77_dhseqr dhseqr_
	#define f77_dlabad dlabad_
	#define f77_dlabrd dlabrd_
	#define f77_dlacn2 dlacn2_
	#define f77_dlacon dlacon_
	#define f77_dlacpy dlacpy_
	#define f77_dladiv dladiv_
	#define f77_dlae2 dlae2_
	#define f77_dlaebz dlaebz_
	#define f77_dlaed0 dlaed0_
	#define f77_dlaed1 dlaed1_
	#define f77_dlaed2 dlaed2_
	#define f77_dlaed3 dlaed3_
	#define f77_dlaed4 dlaed4_
	#define f77_dlaed5 dlaed5_
	#define f77_dlaed6 dlaed6_
	#define f77_dlaed7 dlaed7_
	#define f77_dlaed8 dlaed8_
	#define f77_dlaed9 dlaed9_
	#define f77_dlaeda dlaeda_
	#define f77_dlaein dlaein_
	#define f77_dlaev2 dlaev2_
	#define f77_dlaexc dlaexc_
	#define f77_dlag2 dlag2_
	#define f77_dlags2 dlags2_
	#define f77_dlagtf dlagtf_
	#define f77_dlagtm dlagtm_
	#define f77_dlagts dlagts_
	#define f77_dlagv2 dlagv2_
	#define f77_dlahqr dlahqr_
	#define f77_dlahrd dlahrd_
	#define f77_dlaic1 dlaic1_
	#define f77_dlaln2 dlaln2_
	#define f77_dlals0 dlals0_
	#define f77_dlalsa dlalsa_
	#define f77_dlalsd dlalsd_
	#define f77_dlamch dlamchsub_
	#define f77_dlamc1 dlamc1_
	#define f77_dlamc2 dlamc2_
	#define f77_dlamc3 dlamc3sub_
	#define f77_dlamc4 dlamc4_
	#define f77_dlamc5 dlamc5_
	#define f77_dlamrg dlamrg_
	#define f77_dlangb dlangbsub_
	#define f77_dlange dlangesub_
	#define f77_dlangt dlangtsub_
	#define f77_dlanhs dlanhssub_
	#define f77_dlansb dlansbsub_
	#define f77_dlansp dlanspsub_
	#define f77_dlanst dlanstsub_
	#define f77_dlansy dlansysub_
	#define f77_dlantb dlantbsub_
	#define f77_dlantp dlantpsub_
	#define f77_dlantr dlantrsub_
	#define f77_dlanv2 dlanv2_
	#define f77_dlapll dlapll_
	#define f77_dlapmt dlapmt_
	#define f77_dlapy2 dlapy2sub_
	#define f77_dlapy3 dlapy3sub_
	#define f77_dlaqgb dlaqgb_
	#define f77_dlaqge dlaqge_
	#define f77_dlaqp2 dlaqp2_
	#define f77_dlaqps dlaqps_
	#define f77_dlaqsb dlaqsb_
	#define f77_dlaqsp dlaqsp_
	#define f77_dlaqsy dlaqsy_
	#define f77_dlaqtr dlaqtr_
	#define f77_dlar1v dlar1v_
	#define f77_dlar2v dlar2v_
	#define f77_dlarf dlarf_
	#define f77_dlarfb dlarfb_
	#define f77_dlarfg dlarfg_
	#define f77_dlarft dlarft_
	#define f77_dlarfx dlarfx_
	#define f77_dlargv dlargv_
	#define f77_dlarnv dlarnv_
	#define f77_dlarrb dlarrb_
	#define f77_dlarre dlarre_
	#define f77_dlarrf dlarrf_
	#define f77_dlarrv dlarrv_
	#define f77_dlartg dlartg_
	#define f77_dlartv dlartv_
	#define f77_dlaruv dlaruv_
	#define f77_dlarz dlarz_
	#define f77_dlarzb dlarzb_
	#define f77_dlarzt dlarzt_
	#define f77_dlas2 dlas2_
	#define f77_dlascl dlascl_
	#define f77_dlasd0 dlasd0_
	#define f77_dlasd1 dlasd1_
	#define f77_dlasd2 dlasd2_
	#define f77_dlasd3 dlasd3_
	#define f77_dlasd4 dlasd4_
	#define f77_dlasd5 dlasd5_
	#define f77_dlasd6 dlasd6_
	#define f77_dlasd7 dlasd7_
	#define f77_dlasd8 dlasd8_
	#define f77_dlasda dlasda_
	#define f77_dlasdq dlasdq_
	#define f77_dlasdt dlasdt_
	#define f77_dlaset dlaset_
	#define f77_dlasq1 dlasq1_
	#define f77_dlasq2 dlasq2_
	#define f77_dlasq3 dlasq3_
	#define f77_dlasq4 dlasq4_
	#define f77_dlasq5 dlasq5_
	#define f77_dlasq6 dlasq6_
	#define f77_dlasr dlasr_
	#define f77_dlasrt dlasrt_
	#define f77_dlassq dlassq_
	#define f77_dlasv2 dlasv2_
	#define f77_dlaswp dlaswp_
	#define f77_dlasy2 dlasy2_
	#define f77_dlasyf dlasyf_
	#define f77_dlatbs dlatbs_
	#define f77_dlatdf dlatdf_
	#define f77_dlatps dlatps_
	#define f77_dlatrd dlatrd_
	#define f77_dlatrs dlatrs_
	#define f77_dlatrz dlatrz_
	#define f77_dlatzm dlatzm_
	#define f77_dlauu2 dlauu2_
	#define f77_dlauum dlauum_
	#define f77_dlazq3 dlazq3_
	#define f77_dlazq4 dlazq4_
	#define f77_dopgtr dopgtr_
	#define f77_dopmtr dopmtr_
	#define f77_dorg2l dorg2l_
	#define f77_dorg2r dorg2r_
	#define f77_dorgbr dorgbr_
	#define f77_dorghr dorghr_
	#define f77_dorgl2 dorgl2_
	#define f77_dorglq dorglq_
	#define f77_dorgql dorgql_
	#define f77_dorgqr dorgqr_
	#define f77_dorgr2 dorgr2_
	#define f77_dorgrq dorgrq_
	#define f77_dorgtr dorgtr_
	#define f77_dorm2l dorm2l_
	#define f77_dorm2r dorm2r_
	#define f77_dormbr dormbr_
	#define f77_dormhr dormhr_
	#define f77_dorml2 dorml2_
	#define f77_dormlq dormlq_
	#define f77_dormql dormql_
	#define f77_dormqr dormqr_
	#define f77_dormr2 dormr2_
	#define f77_dormr3 dormr3_
	#define f77_dormrq dormrq_
	#define f77_dormrz dormrz_
	#define f77_dormtr dormtr_
	#define f77_dpbcon dpbcon_
	#define f77_dpbequ dpbequ_
	#define f77_dpbrfs dpbrfs_
	#define f77_dpbstf dpbstf_
	#define f77_dpbsv dpbsv_
	#define f77_dpbsvx dpbsvx_
	#define f77_dpbtf2 dpbtf2_
	#define f77_dpbtrf dpbtrf_
	#define f77_dpbtrs dpbtrs_
	#define f77_dpocon dpocon_
	#define f77_dpoequ dpoequ_
	#define f77_dporfs dporfs_
	#define f77_dposv dposv_
	#define f77_dposvx dposvx_
	#define f77_dpotf2 dpotf2_
	#define f77_dpotrf dpotrf_
	#define f77_dpotri dpotri_
	#define f77_dpotrs dpotrs_
	#define f77_dppcon dppcon_
	#define f77_dppequ dppequ_
	#define f77_dpprfs dpprfs_
	#define f77_dppsv dppsv_
	#define f77_dppsvx dppsvx_
	#define f77_dpptrf dpptrf_
	#define f77_dpptri dpptri_
	#define f77_dpptrs dpptrs_
	#define f77_dptcon dptcon_
	#define f77_dpteqr dpteqr_
	#define f77_dptrfs dptrfs_
	#define f77_dptsv dptsv_
	#define f77_dptsvx dptsvx_
	#define f77_dpttrf dpttrf_
	#define f77_dpttrs dpttrs_
	#define f77_dptts2 dptts2_
	#define f77_drscl drscl_
	#define f77_dsbev dsbev_
	#define f77_dsbevd dsbevd_
	#define f77_dsbevx dsbevx_
	#define f77_dsbgst dsbgst_
	#define f77_dsbgv dsbgv_
	#define f77_dsbgvd dsbgvd_
	#define f77_dsbgvx dsbgvx_
	#define f77_dsbtrd dsbtrd_
	#define f77_dsecnd dsecndsub_
	#define f77_dspcon dspcon_
	#define f77_dspev dspev_
	#define f77_dspevd dspevd_
	#define f77_dspevx dspevx_
	#define f77_dspgst dspgst_
	#define f77_dspgv dspgv_
	#define f77_dspgvd dspgvd_
	#define f77_dspgvx dspgvx_
	#define f77_dsprfs dsprfs_
	#define f77_dspsv dspsv_
	#define f77_dspsvx dspsvx_
	#define f77_dsptrd dsptrd_
	#define f77_dsptrf dsptrf_
	#define f77_dsptri dsptri_
	#define f77_dsptrs dsptrs_
	#define f77_dstebz dstebz_
	#define f77_dstedc dstedc_
	#define f77_dstegr dstegr_
	#define f77_dstein dstein_
	#define f77_dsteqr dsteqr_
	#define f77_dsterf dsterf_
	#define f77_dstev dstev_
	#define f77_dstevd dstevd_
	#define f77_dstevr dstevr_
	#define f77_dstevx dstevx_
	#define f77_dsycon dsycon_
	#define f77_dsyev dsyev_
	#define f77_dsyevd dsyevd_
	#define f77_dsyevr dsyevr_
	#define f77_dsyevx dsyevx_
	#define f77_dsygs2 dsygs2_
	#define f77_dsygst dsygst_
	#define f77_dsygv dsygv_
	#define f77_dsygvd dsygvd_
	#define f77_dsygvx dsygvx_
	#define f77_dsyrfs dsyrfs_
	#define f77_dsysv dsysv_
	#define f77_dsysvx dsysvx_
	#define f77_dsytd2 dsytd2_
	#define f77_dsytf2 dsytf2_
	#define f77_dsytrd dsytrd_
	#define f77_dsytrf dsytrf_
	#define f77_dsytri dsytri_
	#define f77_dsytrs dsytrs_
	#define f77_dtbcon dtbcon_
	#define f77_dtbrfs dtbrfs_
	#define f77_dtbtrs dtbtrs_
	#define f77_dtgevc dtgevc_
	#define f77_dtgex2 dtgex2_
	#define f77_dtgexc dtgexc_
	#define f77_dtgsen dtgsen_
	#define f77_dtgsja dtgsja_
	#define f77_dtgsna dtgsna_
	#define f77_dtgsy2 dtgsy2_
	#define f77_dtgsyl dtgsyl_
	#define f77_dtpcon dtpcon_
	#define f77_dtprfs dtprfs_
	#define f77_dtptri dtptri_
	#define f77_dtptrs dtptrs_
	#define f77_dtrcon dtrcon_
	#define f77_dtrevc dtrevc_
	#define f77_dtrexc dtrexc_
	#define f77_dtrrfs dtrrfs_
	#define f77_dtrsen dtrsen_
	#define f77_dtrsna dtrsna_
	#define f77_dtrsyl dtrsyl_
	#define f77_dtrti2 dtrti2_
	#define f77_dtrtri dtrtri_
	#define f77_dtrtrs dtrtrs_
	#define f77_dtzrqf dtzrqf_
	#define f77_dtzrzf dtzrzf_
	#define f77_dzsum1 dzsum1sub_
	#define f77_icmax1 icmax1sub_
	#define f77_ieeeck ieeecksub_
	#define f77_ilaenv ilaenvsub_
	#define f77_ilaver ilaver_
	#define f77_izmax1 izmax1sub_
	#define f77_lsame lsamesub_
	#define f77_lsamen lsamensub_
	#define f77_sbdsdc sbdsdc_
	#define f77_sbdsqr sbdsqr_
	#define f77_scsum1 scsum1sub_
	#define f77_sdisna sdisna_
	#define f77_second secondsub_
	#define f77_sgbbrd sgbbrd_
	#define f77_sgbcon sgbcon_
	#define f77_sgbequ sgbequ_
	#define f77_sgbrfs sgbrfs_
	#define f77_sgbsv sgbsv_
	#define f77_sgbsvx sgbsvx_
	#define f77_sgbtf2 sgbtf2_
	#define f77_sgbtrf sgbtrf_
	#define f77_sgbtrs sgbtrs_
	#define f77_sgebak sgebak_
	#define f77_sgebal sgebal_
	#define f77_sgebd2 sgebd2_
	#define f77_sgebrd sgebrd_
	#define f77_sgecon sgecon_
	#define f77_sgeequ sgeequ_
	#define f77_sgees sgees_
	#define f77_sgeesx sgeesx_
	#define f77_sgeev sgeev_
	#define f77_sgeevx sgeevx_
	#define f77_sgegs sgegs_
	#define f77_sgegv sgegv_
	#define f77_sgehd2 sgehd2_
	#define f77_sgehrd sgehrd_
	#define f77_sgelq2 sgelq2_
	#define f77_sgelqf sgelqf_
	#define f77_sgels sgels_
	#define f77_sgelsd sgelsd_
	#define f77_sgelss sgelss_
	#define f77_sgelsx sgelsx_
	#define f77_sgelsy sgelsy_
	#define f77_sgeql2 sgeql2_
	#define f77_sgeqlf sgeqlf_
	#define f77_sgeqp3 sgeqp3_
	#define f77_sgeqpf sgeqpf_
	#define f77_sgeqr2 sgeqr2_
	#define f77_sgeqrf sgeqrf_
	#define f77_sgerfs sgerfs_
	#define f77_sgerq2 sgerq2_
	#define f77_sgerqf sgerqf_
	#define f77_sgesc2 sgesc2_
	#define f77_sgesdd sgesdd_
	#define f77_sgesv sgesv_
	#define f77_sgesvd sgesvd_
	#define f77_sgesvx sgesvx_
	#define f77_sgetc2 sgetc2_
	#define f77_sgetf2 sgetf2_
	#define f77_sgetrf sgetrf_
	#define f77_sgetri sgetri_
	#define f77_sgetrs sgetrs_
	#define f77_sggbak sggbak_
	#define f77_sggbal sggbal_
	#define f77_sgges sgges_
	#define f77_sggesx sggesx_
	#define f77_sggev sggev_
	#define f77_sggevx sggevx_
	#define f77_sggglm sggglm_
	#define f77_sgghrd sgghrd_
	#define f77_sgglse sgglse_
	#define f77_sggqrf sggqrf_
	#define f77_sggrqf sggrqf_
	#define f77_sggsvd sggsvd_
	#define f77_sggsvp sggsvp_
	#define f77_sgtcon sgtcon_
	#define f77_sgtrfs sgtrfs_
	#define f77_sgtsv sgtsv_
	#define f77_sgtsvx sgtsvx_
	#define f77_sgttrf sgttrf_
	#define f77_sgttrs sgttrs_
	#define f77_sgtts2 sgtts2_
	#define f77_shgeqz shgeqz_
	#define f77_shsein shsein_
	#define f77_shseqr shseqr_
	#define f77_slabad slabad_
	#define f77_slabrd slabrd_
	#define f77_slacn2 slacn2_
	#define f77_slacon slacon_
	#define f77_slacpy slacpy_
	#define f77_sladiv sladiv_
	#define f77_slae2 slae2_
	#define f77_slaebz slaebz_
	#define f77_slaed0 slaed0_
	#define f77_slaed1 slaed1_
	#define f77_slaed2 slaed2_
	#define f77_slaed3 slaed3_
	#define f77_slaed4 slaed4_
	#define f77_slaed5 slaed5_
	#define f77_slaed6 slaed6_
	#define f77_slaed7 slaed7_
	#define f77_slaed8 slaed8_
	#define f77_slaed9 slaed9_
	#define f77_slaeda slaeda_
	#define f77_slaein slaein_
	#define f77_slaev2 slaev2_
	#define f77_slaexc slaexc_
	#define f77_slag2 slag2_
	#define f77_slags2 slags2_
	#define f77_slagtf slagtf_
	#define f77_slagtm slagtm_
	#define f77_slagts slagts_
	#define f77_slagv2 slagv2_
	#define f77_slahqr slahqr_
	#define f77_slahrd slahrd_
	#define f77_slaic1 slaic1_
	#define f77_slaln2 slaln2_
	#define f77_slals0 slals0_
	#define f77_slalsa slalsa_
	#define f77_slalsd slalsd_
	#define f77_slamch slamchsub_
	#define f77_slamc1 slamc1_
	#define f77_slamc2 slamc2_
	#define f77_slamc3 slamc3sub_
	#define f77_slamc4 slamc4_
	#define f77_slamc5 slamc5_
	#define f77_slamrg slamrg_
	#define f77_slangb slangbsub_
	#define f77_slange slangesub_
	#define f77_slangt slangtsub_
	#define f77_slanhs slanhssub_
	#define f77_slansb slansbsub_
	#define f77_slansp slanspsub_
	#define f77_slanst slanstsub_
	#define f77_slansy slansysub_
	#define f77_slantb slantbsub_
	#define f77_slantp slantpsub_
	#define f77_slantr slantrsub_
	#define f77_slanv2 slanv2_
	#define f77_slapll slapll_
	#define f77_slapmt slapmt_
	#define f77_slapy2 slapy2sub_
	#define f77_slapy3 slapy3sub_
	#define f77_slaqgb slaqgb_
	#define f77_slaqge slaqge_
	#define f77_slaqp2 slaqp2_
	#define f77_slaqps slaqps_
	#define f77_slaqsb slaqsb_
	#define f77_slaqsp slaqsp_
	#define f77_slaqsy slaqsy_
	#define f77_slaqtr slaqtr_
	#define f77_slar1v slar1v_
	#define f77_slar2v slar2v_
	#define f77_slarf slarf_
	#define f77_slarfb slarfb_
	#define f77_slarfg slarfg_
	#define f77_slarft slarft_
	#define f77_slarfx slarfx_
	#define f77_slargv slargv_
	#define f77_slarnv slarnv_
	#define f77_slarrb slarrb_
	#define f77_slarre slarre_
	#define f77_slarrf slarrf_
	#define f77_slarrv slarrv_
	#define f77_slartg slartg_
	#define f77_slartv slartv_
	#define f77_slaruv slaruv_
	#define f77_slarz slarz_
	#define f77_slarzb slarzb_
	#define f77_slarzt slarzt_
	#define f77_slas2 slas2_
	#define f77_slascl slascl_
	#define f77_slasd0 slasd0_
	#define f77_slasd1 slasd1_
	#define f77_slasd2 slasd2_
	#define f77_slasd3 slasd3_
	#define f77_slasd4 slasd4_
	#define f77_slasd5 slasd5_
	#define f77_slasd6 slasd6_
	#define f77_slasd7 slasd7_
	#define f77_slasd8 slasd8_
	#define f77_slasda slasda_
	#define f77_slasdq slasdq_
	#define f77_slasdt slasdt_
	#define f77_slaset slaset_
	#define f77_slasq1 slasq1_
	#define f77_slasq2 slasq2_
	#define f77_slasq3 slasq3_
	#define f77_slasq4 slasq4_
	#define f77_slasq5 slasq5_
	#define f77_slasq6 slasq6_
	#define f77_slasr slasr_
	#define f77_slasrt slasrt_
	#define f77_slassq slassq_
	#define f77_slasv2 slasv2_
	#define f77_slaswp slaswp_
	#define f77_slasy2 slasy2_
	#define f77_slasyf slasyf_
	#define f77_slatbs slatbs_
	#define f77_slatdf slatdf_
	#define f77_slatps slatps_
	#define f77_slatrd slatrd_
	#define f77_slatrs slatrs_
	#define f77_slatrz slatrz_
	#define f77_slatzm slatzm_
	#define f77_slauu2 slauu2_
	#define f77_slauum slauum_
	#define f77_slazq3 slazq3_
	#define f77_slazq4 slazq4_
	#define f77_sopgtr sopgtr_
	#define f77_sopmtr sopmtr_
	#define f77_sorg2l sorg2l_
	#define f77_sorg2r sorg2r_
	#define f77_sorgbr sorgbr_
	#define f77_sorghr sorghr_
	#define f77_sorgl2 sorgl2_
	#define f77_sorglq sorglq_
	#define f77_sorgql sorgql_
	#define f77_sorgqr sorgqr_
	#define f77_sorgr2 sorgr2_
	#define f77_sorgrq sorgrq_
	#define f77_sorgtr sorgtr_
	#define f77_sorm2l sorm2l_
	#define f77_sorm2r sorm2r_
	#define f77_sormbr sormbr_
	#define f77_sormhr sormhr_
	#define f77_sorml2 sorml2_
	#define f77_sormlq sormlq_
	#define f77_sormql sormql_
	#define f77_sormqr sormqr_
	#define f77_sormr2 sormr2_
	#define f77_sormr3 sormr3_
	#define f77_sormrq sormrq_
	#define f77_sormrz sormrz_
	#define f77_sormtr sormtr_
	#define f77_spbcon spbcon_
	#define f77_spbequ spbequ_
	#define f77_spbrfs spbrfs_
	#define f77_spbstf spbstf_
	#define f77_spbsv spbsv_
	#define f77_spbsvx spbsvx_
	#define f77_spbtf2 spbtf2_
	#define f77_spbtrf spbtrf_
	#define f77_spbtrs spbtrs_
	#define f77_spocon spocon_
	#define f77_spoequ spoequ_
	#define f77_sporfs sporfs_
	#define f77_sposv sposv_
	#define f77_sposvx sposvx_
	#define f77_spotf2 spotf2_
	#define f77_spotrf spotrf_
	#define f77_spotri spotri_
	#define f77_spotrs spotrs_
	#define f77_sppcon sppcon_
	#define f77_sppequ sppequ_
	#define f77_spprfs spprfs_
	#define f77_sppsv sppsv_
	#define f77_sppsvx sppsvx_
	#define f77_spptrf spptrf_
	#define f77_spptri spptri_
	#define f77_spptrs spptrs_
	#define f77_sptcon sptcon_
	#define f77_spteqr spteqr_
	#define f77_sptrfs sptrfs_
	#define f77_sptsv sptsv_
	#define f77_sptsvx sptsvx_
	#define f77_spttrf spttrf_
	#define f77_spttrs spttrs_
	#define f77_sptts2 sptts2_
	#define f77_srscl srscl_
	#define f77_ssbev ssbev_
	#define f77_ssbevd ssbevd_
	#define f77_ssbevx ssbevx_
	#define f77_ssbgst ssbgst_
	#define f77_ssbgv ssbgv_
	#define f77_ssbgvd ssbgvd_
	#define f77_ssbgvx ssbgvx_
	#define f77_ssbtrd ssbtrd_
	#define f77_sspcon sspcon_
	#define f77_sspev sspev_
	#define f77_sspevd sspevd_
	#define f77_sspevx sspevx_
	#define f77_sspgst sspgst_
	#define f77_sspgv sspgv_
	#define f77_sspgvd sspgvd_
	#define f77_sspgvx sspgvx_
	#define f77_ssprfs ssprfs_
	#define f77_sspsv sspsv_
	#define f77_sspsvx sspsvx_
	#define f77_ssptrd ssptrd_
	#define f77_ssptrf ssptrf_
	#define f77_ssptri ssptri_
	#define f77_ssptrs ssptrs_
	#define f77_sstebz sstebz_
	#define f77_sstedc sstedc_
	#define f77_sstegr sstegr_
	#define f77_sstein sstein_
	#define f77_ssteqr ssteqr_
	#define f77_ssterf ssterf_
	#define f77_sstev sstev_
	#define f77_sstevd sstevd_
	#define f77_sstevr sstevr_
	#define f77_sstevx sstevx_
	#define f77_ssycon ssycon_
	#define f77_ssyev ssyev_
	#define f77_ssyevd ssyevd_
	#define f77_ssyevr ssyevr_
	#define f77_ssyevx ssyevx_
	#define f77_ssygs2 ssygs2_
	#define f77_ssygst ssygst_
	#define f77_ssygv ssygv_
	#define f77_ssygvd ssygvd_
	#define f77_ssygvx ssygvx_
	#define f77_ssyrfs ssyrfs_
	#define f77_ssysv ssysv_
	#define f77_ssysvx ssysvx_
	#define f77_ssytd2 ssytd2_
	#define f77_ssytf2 ssytf2_
	#define f77_ssytrd ssytrd_
	#define f77_ssytrf ssytrf_
	#define f77_ssytri ssytri_
	#define f77_ssytrs ssytrs_
	#define f77_stbcon stbcon_
	#define f77_stbrfs stbrfs_
	#define f77_stbtrs stbtrs_
	#define f77_stgevc stgevc_
	#define f77_stgex2 stgex2_
	#define f77_stgexc stgexc_
	#define f77_stgsen stgsen_
	#define f77_stgsja stgsja_
	#define f77_stgsna stgsna_
	#define f77_stgsy2 stgsy2_
	#define f77_stgsyl stgsyl_
	#define f77_stpcon stpcon_
	#define f77_stprfs stprfs_
	#define f77_stptri stptri_
	#define f77_stptrs stptrs_
	#define f77_strcon strcon_
	#define f77_strevc strevc_
	#define f77_strexc strexc_
	#define f77_strrfs strrfs_
	#define f77_strsen strsen_
	#define f77_strsna strsna_
	#define f77_strsyl strsyl_
	#define f77_strti2 strti2_
	#define f77_strtri strtri_
	#define f77_strtrs strtrs_
	#define f77_stzrqf stzrqf_
	#define f77_stzrzf stzrzf_
	#define f77_xerbla xerbla_
	#define f77_zbdsqr zbdsqr_
	#define f77_zdrot zdrot_
	#define f77_zdrscl zdrscl_
	#define f77_zgbbrd zgbbrd_
	#define f77_zgbcon zgbcon_
	#define f77_zgbequ zgbequ_
	#define f77_zgbrfs zgbrfs_
	#define f77_zgbsv zgbsv_
	#define f77_zgbsvx zgbsvx_
	#define f77_zgbtf2 zgbtf2_
	#define f77_zgbtrf zgbtrf_
	#define f77_zgbtrs zgbtrs_
	#define f77_zgebak zgebak_
	#define f77_zgebal zgebal_
	#define f77_zgebd2 zgebd2_
	#define f77_zgebrd zgebrd_
	#define f77_zgecon zgecon_
	#define f77_zgeequ zgeequ_
	#define f77_zgees zgees_
	#define f77_zgeesx zgeesx_
	#define f77_zgeev zgeev_
	#define f77_zgeevx zgeevx_
	#define f77_zgegs zgegs_
	#define f77_zgegv zgegv_
	#define f77_zgehd2 zgehd2_
	#define f77_zgehrd zgehrd_
	#define f77_zgelq2 zgelq2_
	#define f77_zgelqf zgelqf_
	#define f77_zgels zgels_
	#define f77_zgelsd zgelsd_
	#define f77_zgelss zgelss_
	#define f77_zgelsx zgelsx_
	#define f77_zgelsy zgelsy_
	#define f77_zgeql2 zgeql2_
	#define f77_zgeqlf zgeqlf_
	#define f77_zgeqp3 zgeqp3_
	#define f77_zgeqpf zgeqpf_
	#define f77_zgeqr2 zgeqr2_
	#define f77_zgeqrf zgeqrf_
	#define f77_zgerfs zgerfs_
	#define f77_zgerq2 zgerq2_
	#define f77_zgerqf zgerqf_
	#define f77_zgesc2 zgesc2_
	#define f77_zgesdd zgesdd_
	#define f77_zgesv zgesv_
	#define f77_zgesvd zgesvd_
	#define f77_zgesvx zgesvx_
	#define f77_zgetc2 zgetc2_
	#define f77_zgetf2 zgetf2_
	#define f77_zgetrf zgetrf_
	#define f77_zgetri zgetri_
	#define f77_zgetrs zgetrs_
	#define f77_zggbak zggbak_
	#define f77_zggbal zggbal_
	#define f77_zgges zgges_
	#define f77_zggesx zggesx_
	#define f77_zggev zggev_
	#define f77_zggevx zggevx_
	#define f77_zggglm zggglm_
	#define f77_zgghrd zgghrd_
	#define f77_zgglse zgglse_
	#define f77_zggqrf zggqrf_
	#define f77_zggrqf zggrqf_
	#define f77_zggsvd zggsvd_
	#define f77_zggsvp zggsvp_
	#define f77_zgtcon zgtcon_
	#define f77_zgtrfs zgtrfs_
	#define f77_zgtsv zgtsv_
	#define f77_zgtsvx zgtsvx_
	#define f77_zgttrf zgttrf_
	#define f77_zgttrs zgttrs_
	#define f77_zgtts2 zgtts2_
	#define f77_zhbev zhbev_
	#define f77_zhbevd zhbevd_
	#define f77_zhbevx zhbevx_
	#define f77_zhbgst zhbgst_
	#define f77_zhbgv zhbgv_
	#define f77_zhbgvd zhbgvd_
	#define f77_zhbgvx zhbgvx_
	#define f77_zhbtrd zhbtrd_
	#define f77_zhecon zhecon_
	#define f77_zheev zheev_
	#define f77_zheevd zheevd_
	#define f77_zheevr zheevr_
	#define f77_zheevx zheevx_
	#define f77_zhegs2 zhegs2_
	#define f77_zhegst zhegst_
	#define f77_zhegv zhegv_
	#define f77_zhegvd zhegvd_
	#define f77_zhegvx zhegvx_
	#define f77_zherfs zherfs_
	#define f77_zhesv zhesv_
	#define f77_zhesvx zhesvx_
	#define f77_zhetd2 zhetd2_
	#define f77_zhetf2 zhetf2_
	#define f77_zhetrd zhetrd_
	#define f77_zhetrf zhetrf_
	#define f77_zhetri zhetri_
	#define f77_zhetrs zhetrs_
	#define f77_zhgeqz zhgeqz_
	#define f77_zhpcon zhpcon_
	#define f77_zhpev zhpev_
	#define f77_zhpevd zhpevd_
	#define f77_zhpevx zhpevx_
	#define f77_zhpgst zhpgst_
	#define f77_zhpgv zhpgv_
	#define f77_zhpgvd zhpgvd_
	#define f77_zhpgvx zhpgvx_
	#define f77_zhprfs zhprfs_
	#define f77_zhpsv zhpsv_
	#define f77_zhpsvx zhpsvx_
	#define f77_zhptrd zhptrd_
	#define f77_zhptrf zhptrf_
	#define f77_zhptri zhptri_
	#define f77_zhptrs zhptrs_
	#define f77_zhsein zhsein_
	#define f77_zhseqr zhseqr_
	#define f77_zlabrd zlabrd_
	#define f77_zlacgv zlacgv_
	#define f77_zlacn2 zlacn2_
	#define f77_zlacon zlacon_
	#define f77_zlacp2 zlacp2_
	#define f77_zlacpy zlacpy_
	#define f77_zlacrm zlacrm_
	#define f77_zlacrt zlacrt_
	#define f77_zladiv zladivsub_
	#define f77_zlaed0 zlaed0_
	#define f77_zlaed7 zlaed7_
	#define f77_zlaed8 zlaed8_
	#define f77_zlaein zlaein_
	#define f77_zlaesy zlaesy_
	#define f77_zlaev2 zlaev2_
	#define f77_zlags2 zlags2_
	#define f77_zlagtm zlagtm_
	#define f77_zlahef zlahef_
	#define f77_zlahqr zlahqr_
	#define f77_zlahrd zlahrd_
	#define f77_zlaic1 zlaic1_
	#define f77_zlals0 zlals0_
	#define f77_zlalsa zlalsa_
	#define f77_zlalsd zlalsd_
	#define f77_zlangb zlangbsub_
	#define f77_zlange zlangesub_
	#define f77_zlangt zlangtsub_
	#define f77_zlanhb zlanhbsub_
	#define f77_zlanhe zlanhesub_
	#define f77_zlanhp zlanhpsub_
	#define f77_zlanhs zlanhssub_
	#define f77_zlanht zlanhtsub_
	#define f77_zlansb zlansbsub_
	#define f77_zlansp zlanspsub_
	#define f77_zlansy zlansysub_
	#define f77_zlantb zlantbsub_
	#define f77_zlantp zlantpsub_
	#define f77_zlantr zlantrsub_
	#define f77_zlapll zlapll_
	#define f77_zlapmt zlapmt_
	#define f77_zlaqgb zlaqgb_
	#define f77_zlaqge zlaqge_
	#define f77_zlaqhb zlaqhb_
	#define f77_zlaqhe zlaqhe_
	#define f77_zlaqhp zlaqhp_
	#define f77_zlaqp2 zlaqp2_
	#define f77_zlaqps zlaqps_
	#define f77_zlaqsb zlaqsb_
	#define f77_zlaqsp zlaqsp_
	#define f77_zlaqsy zlaqsy_
	#define f77_zlar1v zlar1v_
	#define f77_zlar2v zlar2v_
	#define f77_zlarcm zlarcm_
	#define f77_zlarf zlarf_
	#define f77_zlarfb zlarfb_
	#define f77_zlarfg zlarfg_
	#define f77_zlarft zlarft_
	#define f77_zlarfx zlarfx_
	#define f77_zlargv zlargv_
	#define f77_zlarnv zlarnv_
	#define f77_zlarrv zlarrv_
	#define f77_zlartg zlartg_
	#define f77_zlartv zlartv_
	#define f77_zlarz zlarz_
	#define f77_zlarzb zlarzb_
	#define f77_zlarzt zlarzt_
	#define f77_zlascl zlascl_
	#define f77_zlaset zlaset_
	#define f77_zlasr zlasr_
	#define f77_zlassq zlassq_
	#define f77_zlaswp zlaswp_
	#define f77_zlasyf zlasyf_
	#define f77_zlatbs zlatbs_
	#define f77_zlatdf zlatdf_
	#define f77_zlatps zlatps_
	#define f77_zlatrd zlatrd_
	#define f77_zlatrs zlatrs_
	#define f77_zlatrz zlatrz_
	#define f77_zlatzm zlatzm_
	#define f77_zlauu2 zlauu2_
	#define f77_zlauum zlauum_
	#define f77_zpbcon zpbcon_
	#define f77_zpbequ zpbequ_
	#define f77_zpbrfs zpbrfs_
	#define f77_zpbstf zpbstf_
	#define f77_zpbsv zpbsv_
	#define f77_zpbsvx zpbsvx_
	#define f77_zpbtf2 zpbtf2_
	#define f77_zpbtrf zpbtrf_
	#define f77_zpbtrs zpbtrs_
	#define f77_zpocon zpocon_
	#define f77_zpoequ zpoequ_
	#define f77_zporfs zporfs_
	#define f77_zposv zposv_
	#define f77_zposvx zposvx_
	#define f77_zpotf2 zpotf2_
	#define f77_zpotrf zpotrf_
	#define f77_zpotri zpotri_
	#define f77_zpotrs zpotrs_
	#define f77_zppcon zppcon_
	#define f77_zppequ zppequ_
	#define f77_zpprfs zpprfs_
	#define f77_zppsv zppsv_
	#define f77_zppsvx zppsvx_
	#define f77_zpptrf zpptrf_
	#define f77_zpptri zpptri_
	#define f77_zpptrs zpptrs_
	#define f77_zptcon zptcon_
	#define f77_zpteqr zpteqr_
	#define f77_zptrfs zptrfs_
	#define f77_zptsv zptsv_
	#define f77_zptsvx zptsvx_
	#define f77_zpttrf zpttrf_
	#define f77_zpttrs zpttrs_
	#define f77_zptts2 zptts2_
	#define f77_zrot zrot_
	#define f77_zspcon zspcon_
	#define f77_zspmv zspmv_
	#define f77_zspr zspr_
	#define f77_zsprfs zsprfs_
	#define f77_zspsv zspsv_
	#define f77_zspsvx zspsvx_
	#define f77_zsptrf zsptrf_
	#define f77_zsptri zsptri_
	#define f77_zsptrs zsptrs_
	#define f77_zstedc zstedc_
	#define f77_zstegr zstegr_
	#define f77_zstein zstein_
	#define f77_zsteqr zsteqr_
	#define f77_zsycon zsycon_
	#define f77_zsymv zsymv_
	#define f77_zsyr zsyr_
	#define f77_zsyrfs zsyrfs_
	#define f77_zsysv zsysv_
	#define f77_zsysvx zsysvx_
	#define f77_zsytf2 zsytf2_
	#define f77_zsytrf zsytrf_
	#define f77_zsytri zsytri_
	#define f77_zsytrs zsytrs_
	#define f77_ztbcon ztbcon_
	#define f77_ztbrfs ztbrfs_
	#define f77_ztbtrs ztbtrs_
	#define f77_ztgevc ztgevc_
	#define f77_ztgex2 ztgex2_
	#define f77_ztgexc ztgexc_
	#define f77_ztgsen ztgsen_
	#define f77_ztgsja ztgsja_
	#define f77_ztgsna ztgsna_
	#define f77_ztgsy2 ztgsy2_
	#define f77_ztgsyl ztgsyl_
	#define f77_ztpcon ztpcon_
	#define f77_ztprfs ztprfs_
	#define f77_ztptri ztptri_
	#define f77_ztptrs ztptrs_
	#define f77_ztrcon ztrcon_
	#define f77_ztrevc ztrevc_
	#define f77_ztrexc ztrexc_
	#define f77_ztrrfs ztrrfs_
	#define f77_ztrsen ztrsen_
	#define f77_ztrsna ztrsna_
	#define f77_ztrsyl ztrsyl_
	#define f77_ztrti2 ztrti2_
	#define f77_ztrtri ztrtri_
	#define f77_ztrtrs ztrtrs_
	#define f77_ztzrqf ztzrqf_
	#define f77_ztzrzf ztzrzf_
	#define f77_zung2l zung2l_
	#define f77_zung2r zung2r_
	#define f77_zungbr zungbr_
	#define f77_zunghr zunghr_
	#define f77_zungl2 zungl2_
	#define f77_zunglq zunglq_
	#define f77_zungql zungql_
	#define f77_zungqr zungqr_
	#define f77_zungr2 zungr2_
	#define f77_zungrq zungrq_
	#define f77_zungtr zungtr_
	#define f77_zunm2l zunm2l_
	#define f77_zunm2r zunm2r_
	#define f77_zunmbr zunmbr_
	#define f77_zunmhr zunmhr_
	#define f77_zunml2 zunml2_
	#define f77_zunmlq zunmlq_
	#define f77_zunmql zunmql_
	#define f77_zunmqr zunmqr_
	#define f77_zunmr2 zunmr2_
	#define f77_zunmr3 zunmr3_
	#define f77_zunmrq zunmrq_
	#define f77_zunmrz zunmrz_
	#define f77_zunmtr zunmtr_
	#define f77_zupgtr zupgtr_
	#define f77_zupmtr zupmtr_
#elif defined(UPCASE)
	#define f77_cbdsqr CBDSQR
	#define f77_cgbbrd CGBBRD
	#define f77_cgbcon CGBCON
	#define f77_cgbequ CGBEQU
	#define f77_cgbrfs CGBRFS
	#define f77_cgbsv CGBSV
	#define f77_cgbsvx CGBSVX
	#define f77_cgbtf2 CGBTF2
	#define f77_cgbtrf CGBTRF
	#define f77_cgbtrs CGBTRS
	#define f77_cgebak CGEBAK
	#define f77_cgebal CGEBAL
	#define f77_cgebd2 CGEBD2
	#define f77_cgebrd CGEBRD
	#define f77_cgecon CGECON
	#define f77_cgeequ CGEEQU
	#define f77_cgees CGEES
	#define f77_cgeesx CGEESX
	#define f77_cgeev CGEEV
	#define f77_cgeevx CGEEVX
	#define f77_cgegs CGEGS
	#define f77_cgegv CGEGV
	#define f77_cgehd2 CGEHD2
	#define f77_cgehrd CGEHRD
	#define f77_cgelq2 CGELQ2
	#define f77_cgelqf CGELQF
	#define f77_cgels CGELS
	#define f77_cgelsd CGELSD
	#define f77_cgelss CGELSS
	#define f77_cgelsx CGELSX
	#define f77_cgelsy CGELSY
	#define f77_cgeql2 CGEQL2
	#define f77_cgeqlf CGEQLF
	#define f77_cgeqp3 CGEQP3
	#define f77_cgeqpf CGEQPF
	#define f77_cgeqr2 CGEQR2
	#define f77_cgeqrf CGEQRF
	#define f77_cgerfs CGERFS
	#define f77_cgerq2 CGERQ2
	#define f77_cgerqf CGERQF
	#define f77_cgesc2 CGESC2
	#define f77_cgesdd CGESDD
	#define f77_cgesv CGESV
	#define f77_cgesvd CGESVD
	#define f77_cgesvx CGESVX
	#define f77_cgetc2 CGETC2
	#define f77_cgetf2 CGETF2
	#define f77_cgetrf CGETRF
	#define f77_cgetri CGETRI
	#define f77_cgetrs CGETRS
	#define f77_cggbak CGGBAK
	#define f77_cggbal CGGBAL
	#define f77_cgges CGGES
	#define f77_cggesx CGGESX
	#define f77_cggev CGGEV
	#define f77_cggevx CGGEVX
	#define f77_cggglm CGGGLM
	#define f77_cgghrd CGGHRD
	#define f77_cgglse CGGLSE
	#define f77_cggqrf CGGQRF
	#define f77_cggrqf CGGRQF
	#define f77_cggsvd CGGSVD
	#define f77_cggsvp CGGSVP
	#define f77_cgtcon CGTCON
	#define f77_cgtrfs CGTRFS
	#define f77_cgtsv CGTSV
	#define f77_cgtsvx CGTSVX
	#define f77_cgttrf CGTTRF
	#define f77_cgttrs CGTTRS
	#define f77_cgtts2 CGTTS2
	#define f77_chbev CHBEV
	#define f77_chbevd CHBEVD
	#define f77_chbevx CHBEVX
	#define f77_chbgst CHBGST
	#define f77_chbgv CHBGV
	#define f77_chbgvd CHBGVD
	#define f77_chbgvx CHBGVX
	#define f77_chbtrd CHBTRD
	#define f77_checon CHECON
	#define f77_cheev CHEEV
	#define f77_cheevd CHEEVD
	#define f77_cheevr CHEEVR
	#define f77_cheevx CHEEVX
	#define f77_chegs2 CHEGS2
	#define f77_chegst CHEGST
	#define f77_chegv CHEGV
	#define f77_chegvd CHEGVD
	#define f77_chegvx CHEGVX
	#define f77_cherfs CHERFS
	#define f77_chesv CHESV
	#define f77_chesvx CHESVX
	#define f77_chetd2 CHETD2
	#define f77_chetf2 CHETF2
	#define f77_chetrd CHETRD
	#define f77_chetrf CHETRF
	#define f77_chetri CHETRI
	#define f77_chetrs CHETRS
	#define f77_chgeqz CHGEQZ
	#define f77_chpcon CHPCON
	#define f77_chpev CHPEV
	#define f77_chpevd CHPEVD
	#define f77_chpevx CHPEVX
	#define f77_chpgst CHPGST
	#define f77_chpgv CHPGV
	#define f77_chpgvd CHPGVD
	#define f77_chpgvx CHPGVX
	#define f77_chprfs CHPRFS
	#define f77_chpsv CHPSV
	#define f77_chpsvx CHPSVX
	#define f77_chptrd CHPTRD
	#define f77_chptrf CHPTRF
	#define f77_chptri CHPTRI
	#define f77_chptrs CHPTRS
	#define f77_chsein CHSEIN
	#define f77_chseqr CHSEQR
	#define f77_clabrd CLABRD
	#define f77_clacgv CLACGV
	#define f77_clacn2 CLACN2
	#define f77_clacon CLACON
	#define f77_clacp2 CLACP2
	#define f77_clacpy CLACPY
	#define f77_clacrm CLACRM
	#define f77_clacrt CLACRT
	#define f77_cladiv CLADIVSUB
	#define f77_claed0 CLAED0
	#define f77_claed7 CLAED7
	#define f77_claed8 CLAED8
	#define f77_claein CLAEIN
	#define f77_claesy CLAESY
	#define f77_claev2 CLAEV2
	#define f77_clags2 CLAGS2
	#define f77_clagtm CLAGTM
	#define f77_clahef CLAHEF
	#define f77_clahqr CLAHQR
	#define f77_clahrd CLAHRD
	#define f77_claic1 CLAIC1
	#define f77_clals0 CLALS0
	#define f77_clalsa CLALSA
	#define f77_clalsd CLALSD
	#define f77_clangb CLANGBSUB
	#define f77_clange CLANGESUB
	#define f77_clangt CLANGTSUB
	#define f77_clanhb CLANHBSUB
	#define f77_clanhe CLANHESUB
	#define f77_clanhp CLANHPSUB
	#define f77_clanhs CLANHSSUB
	#define f77_clanht CLANHTSUB
	#define f77_clansb CLANSBSUB
	#define f77_clansp CLANSPSUB
	#define f77_clansy CLANSYSUB
	#define f77_clantb CLANTBSUB
	#define f77_clantp CLANTPSUB
	#define f77_clantr CLANTRSUB
	#define f77_clapll CLAPLL
	#define f77_clapmt CLAPMT
	#define f77_claqgb CLAQGB
	#define f77_claqge CLAQGE
	#define f77_claqhb CLAQHB
	#define f77_claqhe CLAQHE
	#define f77_claqhp CLAQHP
	#define f77_claqp2 CLAQP2
	#define f77_claqps CLAQPS
	#define f77_claqsb CLAQSB
	#define f77_claqsp CLAQSP
	#define f77_claqsy CLAQSY
	#define f77_clar1v CLAR1V
	#define f77_clar2v CLAR2V
	#define f77_clarcm CLARCM
	#define f77_clarf CLARF
	#define f77_clarfb CLARFB
	#define f77_clarfg CLARFG
	#define f77_clarft CLARFT
	#define f77_clarfx CLARFX
	#define f77_clargv CLARGV
	#define f77_clarnv CLARNV
	#define f77_clarrv CLARRV
	#define f77_clartg CLARTG
	#define f77_clartv CLARTV
	#define f77_clarz CLARZ
	#define f77_clarzb CLARZB
	#define f77_clarzt CLARZT
	#define f77_clascl CLASCL
	#define f77_claset CLASET
	#define f77_clasr CLASR
	#define f77_classq CLASSQ
	#define f77_claswp CLASWP
	#define f77_clasyf CLASYF
	#define f77_clatbs CLATBS
	#define f77_clatdf CLATDF
	#define f77_clatps CLATPS
	#define f77_clatrd CLATRD
	#define f77_clatrs CLATRS
	#define f77_clatrz CLATRZ
	#define f77_clatzm CLATZM
	#define f77_clauu2 CLAUU2
	#define f77_clauum CLAUUM
	#define f77_cpbcon CPBCON
	#define f77_cpbequ CPBEQU
	#define f77_cpbrfs CPBRFS
	#define f77_cpbstf CPBSTF
	#define f77_cpbsv CPBSV
	#define f77_cpbsvx CPBSVX
	#define f77_cpbtf2 CPBTF2
	#define f77_cpbtrf CPBTRF
	#define f77_cpbtrs CPBTRS
	#define f77_cpocon CPOCON
	#define f77_cpoequ CPOEQU
	#define f77_cporfs CPORFS
	#define f77_cposv CPOSV
	#define f77_cposvx CPOSVX
	#define f77_cpotf2 CPOTF2
	#define f77_cpotrf CPOTRF
	#define f77_cpotri CPOTRI
	#define f77_cpotrs CPOTRS
	#define f77_cppcon CPPCON
	#define f77_cppequ CPPEQU
	#define f77_cpprfs CPPRFS
	#define f77_cppsv CPPSV
	#define f77_cppsvx CPPSVX
	#define f77_cpptrf CPPTRF
	#define f77_cpptri CPPTRI
	#define f77_cpptrs CPPTRS
	#define f77_cptcon CPTCON
	#define f77_cpteqr CPTEQR
	#define f77_cptrfs CPTRFS
	#define f77_cptsv CPTSV
	#define f77_cptsvx CPTSVX
	#define f77_cpttrf CPTTRF
	#define f77_cpttrs CPTTRS
	#define f77_cptts2 CPTTS2
	#define f77_crot CROT
	#define f77_cspcon CSPCON
	#define f77_cspmv CSPMV
	#define f77_cspr CSPR
	#define f77_csprfs CSPRFS
	#define f77_cspsv CSPSV
	#define f77_cspsvx CSPSVX
	#define f77_csptrf CSPTRF
	#define f77_csptri CSPTRI
	#define f77_csptrs CSPTRS
	#define f77_csrot CSROT
	#define f77_csrscl CSRSCL
	#define f77_cstedc CSTEDC
	#define f77_cstegr CSTEGR
	#define f77_cstein CSTEIN
	#define f77_csteqr CSTEQR
	#define f77_csycon CSYCON
	#define f77_csymv CSYMV
	#define f77_csyr CSYR
	#define f77_csyrfs CSYRFS
	#define f77_csysv CSYSV
	#define f77_csysvx CSYSVX
	#define f77_csytf2 CSYTF2
	#define f77_csytrf CSYTRF
	#define f77_csytri CSYTRI
	#define f77_csytrs CSYTRS
	#define f77_ctbcon CTBCON
	#define f77_ctbrfs CTBRFS
	#define f77_ctbtrs CTBTRS
	#define f77_ctgevc CTGEVC
	#define f77_ctgex2 CTGEX2
	#define f77_ctgexc CTGEXC
	#define f77_ctgsen CTGSEN
	#define f77_ctgsja CTGSJA
	#define f77_ctgsna CTGSNA
	#define f77_ctgsy2 CTGSY2
	#define f77_ctgsyl CTGSYL
	#define f77_ctpcon CTPCON
	#define f77_ctprfs CTPRFS
	#define f77_ctptri CTPTRI
	#define f77_ctptrs CTPTRS
	#define f77_ctrcon CTRCON
	#define f77_ctrevc CTREVC
	#define f77_ctrexc CTREXC
	#define f77_ctrrfs CTRRFS
	#define f77_ctrsen CTRSEN
	#define f77_ctrsna CTRSNA
	#define f77_ctrsyl CTRSYL
	#define f77_ctrti2 CTRTI2
	#define f77_ctrtri CTRTRI
	#define f77_ctrtrs CTRTRS
	#define f77_ctzrqf CTZRQF
	#define f77_ctzrzf CTZRZF
	#define f77_cung2l CUNG2L
	#define f77_cung2r CUNG2R
	#define f77_cungbr CUNGBR
	#define f77_cunghr CUNGHR
	#define f77_cungl2 CUNGL2
	#define f77_cunglq CUNGLQ
	#define f77_cungql CUNGQL
	#define f77_cungqr CUNGQR
	#define f77_cungr2 CUNGR2
	#define f77_cungrq CUNGRQ
	#define f77_cungtr CUNGTR
	#define f77_cunm2l CUNM2L
	#define f77_cunm2r CUNM2R
	#define f77_cunmbr CUNMBR
	#define f77_cunmhr CUNMHR
	#define f77_cunml2 CUNML2
	#define f77_cunmlq CUNMLQ
	#define f77_cunmql CUNMQL
	#define f77_cunmqr CUNMQR
	#define f77_cunmr2 CUNMR2
	#define f77_cunmr3 CUNMR3
	#define f77_cunmrq CUNMRQ
	#define f77_cunmrz CUNMRZ
	#define f77_cunmtr CUNMTR
	#define f77_cupgtr CUPGTR
	#define f77_cupmtr CUPMTR
	#define f77_dbdsdc DBDSDC
	#define f77_dbdsqr DBDSQR
	#define f77_ddisna DDISNA
	#define f77_dgbbrd DGBBRD
	#define f77_dgbcon DGBCON
	#define f77_dgbequ DGBEQU
	#define f77_dgbrfs DGBRFS
	#define f77_dgbsv DGBSV
	#define f77_dgbsvx DGBSVX
	#define f77_dgbtf2 DGBTF2
	#define f77_dgbtrf DGBTRF
	#define f77_dgbtrs DGBTRS
	#define f77_dgebak DGEBAK
	#define f77_dgebal DGEBAL
	#define f77_dgebd2 DGEBD2
	#define f77_dgebrd DGEBRD
	#define f77_dgecon DGECON
	#define f77_dgeequ DGEEQU
	#define f77_dgees DGEES
	#define f77_dgeesx DGEESX
	#define f77_dgeev DGEEV
	#define f77_dgeevx DGEEVX
	#define f77_dgegs DGEGS
	#define f77_dgegv DGEGV
	#define f77_dgehd2 DGEHD2
	#define f77_dgehrd DGEHRD
	#define f77_dgelq2 DGELQ2
	#define f77_dgelqf DGELQF
	#define f77_dgels DGELS
	#define f77_dgelsd DGELSD
	#define f77_dgelss DGELSS
	#define f77_dgelsx DGELSX
	#define f77_dgelsy DGELSY
	#define f77_dgeql2 DGEQL2
	#define f77_dgeqlf DGEQLF
	#define f77_dgeqp3 DGEQP3
	#define f77_dgeqpf DGEQPF
	#define f77_dgeqr2 DGEQR2
	#define f77_dgeqrf DGEQRF
	#define f77_dgerfs DGERFS
	#define f77_dgerq2 DGERQ2
	#define f77_dgerqf DGERQF
	#define f77_dgesc2 DGESC2
	#define f77_dgesdd DGESDD
	#define f77_dgesv DGESV
	#define f77_dgesvd DGESVD
	#define f77_dgesvx DGESVX
	#define f77_dgetc2 DGETC2
	#define f77_dgetf2 DGETF2
	#define f77_dgetrf DGETRF
	#define f77_dgetri DGETRI
	#define f77_dgetrs DGETRS
	#define f77_dggbak DGGBAK
	#define f77_dggbal DGGBAL
	#define f77_dgges DGGES
	#define f77_dggesx DGGESX
	#define f77_dggev DGGEV
	#define f77_dggevx DGGEVX
	#define f77_dggglm DGGGLM
	#define f77_dgghrd DGGHRD
	#define f77_dgglse DGGLSE
	#define f77_dggqrf DGGQRF
	#define f77_dggrqf DGGRQF
	#define f77_dggsvd DGGSVD
	#define f77_dggsvp DGGSVP
	#define f77_dgtcon DGTCON
	#define f77_dgtrfs DGTRFS
	#define f77_dgtsv DGTSV
	#define f77_dgtsvx DGTSVX
	#define f77_dgttrf DGTTRF
	#define f77_dgttrs DGTTRS
	#define f77_dgtts2 DGTTS2
	#define f77_dhgeqz DHGEQZ
	#define f77_dhsein DHSEIN
	#define f77_dhseqr DHSEQR
	#define f77_dlabad DLABAD
	#define f77_dlabrd DLABRD
	#define f77_dlacn2 DLACN2
	#define f77_dlacon DLACON
	#define f77_dlacpy DLACPY
	#define f77_dladiv DLADIV
	#define f77_dlae2 DLAE2
	#define f77_dlaebz DLAEBZ
	#define f77_dlaed0 DLAED0
	#define f77_dlaed1 DLAED1
	#define f77_dlaed2 DLAED2
	#define f77_dlaed3 DLAED3
	#define f77_dlaed4 DLAED4
	#define f77_dlaed5 DLAED5
	#define f77_dlaed6 DLAED6
	#define f77_dlaed7 DLAED7
	#define f77_dlaed8 DLAED8
	#define f77_dlaed9 DLAED9
	#define f77_dlaeda DLAEDA
	#define f77_dlaein DLAEIN
	#define f77_dlaev2 DLAEV2
	#define f77_dlaexc DLAEXC
	#define f77_dlag2 DLAG2
	#define f77_dlags2 DLAGS2
	#define f77_dlagtf DLAGTF
	#define f77_dlagtm DLAGTM
	#define f77_dlagts DLAGTS
	#define f77_dlagv2 DLAGV2
	#define f77_dlahqr DLAHQR
	#define f77_dlahrd DLAHRD
	#define f77_dlaic1 DLAIC1
	#define f77_dlaln2 DLALN2
	#define f77_dlals0 DLALS0
	#define f77_dlalsa DLALSA
	#define f77_dlalsd DLALSD
	#define f77_dlamch DLAMCHSUB
	#define f77_dlamc1 DLAMC1
	#define f77_dlamc2 DLAMC2
	#define f77_dlamc3 DLAMC3SUB
	#define f77_dlamc4 DLAMC4
	#define f77_dlamc5 DLAMC5
	#define f77_dlamrg DLAMRG
	#define f77_dlangb DLANGBSUB
	#define f77_dlange DLANGESUB
	#define f77_dlangt DLANGTSUB
	#define f77_dlanhs DLANHSSUB
	#define f77_dlansb DLANSBSUB
	#define f77_dlansp DLANSPSUB
	#define f77_dlanst DLANSTSUB
	#define f77_dlansy DLANSYSUB
	#define f77_dlantb DLANTBSUB
	#define f77_dlantp DLANTPSUB
	#define f77_dlantr DLANTRSUB
	#define f77_dlanv2 DLANV2
	#define f77_dlapll DLAPLL
	#define f77_dlapmt DLAPMT
	#define f77_dlapy2 DLAPY2SUB
	#define f77_dlapy3 DLAPY3SUB
	#define f77_dlaqgb DLAQGB
	#define f77_dlaqge DLAQGE
	#define f77_dlaqp2 DLAQP2
	#define f77_dlaqps DLAQPS
	#define f77_dlaqsb DLAQSB
	#define f77_dlaqsp DLAQSP
	#define f77_dlaqsy DLAQSY
	#define f77_dlaqtr DLAQTR
	#define f77_dlar1v DLAR1V
	#define f77_dlar2v DLAR2V
	#define f77_dlarf DLARF
	#define f77_dlarfb DLARFB
	#define f77_dlarfg DLARFG
	#define f77_dlarft DLARFT
	#define f77_dlarfx DLARFX
	#define f77_dlargv DLARGV
	#define f77_dlarnv DLARNV
	#define f77_dlarrb DLARRB
	#define f77_dlarre DLARRE
	#define f77_dlarrf DLARRF
	#define f77_dlarrv DLARRV
	#define f77_dlartg DLARTG
	#define f77_dlartv DLARTV
	#define f77_dlaruv DLARUV
	#define f77_dlarz DLARZ
	#define f77_dlarzb DLARZB
	#define f77_dlarzt DLARZT
	#define f77_dlas2 DLAS2
	#define f77_dlascl DLASCL
	#define f77_dlasd0 DLASD0
	#define f77_dlasd1 DLASD1
	#define f77_dlasd2 DLASD2
	#define f77_dlasd3 DLASD3
	#define f77_dlasd4 DLASD4
	#define f77_dlasd5 DLASD5
	#define f77_dlasd6 DLASD6
	#define f77_dlasd7 DLASD7
	#define f77_dlasd8 DLASD8
	#define f77_dlasda DLASDA
	#define f77_dlasdq DLASDQ
	#define f77_dlasdt DLASDT
	#define f77_dlaset DLASET
	#define f77_dlasq1 DLASQ1
	#define f77_dlasq2 DLASQ2
	#define f77_dlasq3 DLASQ3
	#define f77_dlasq4 DLASQ4
	#define f77_dlasq5 DLASQ5
	#define f77_dlasq6 DLASQ6
	#define f77_dlasr DLASR
	#define f77_dlasrt DLASRT
	#define f77_dlassq DLASSQ
	#define f77_dlasv2 DLASV2
	#define f77_dlaswp DLASWP
	#define f77_dlasy2 DLASY2
	#define f77_dlasyf DLASYF
	#define f77_dlatbs DLATBS
	#define f77_dlatdf DLATDF
	#define f77_dlatps DLATPS
	#define f77_dlatrd DLATRD
	#define f77_dlatrs DLATRS
	#define f77_dlatrz DLATRZ
	#define f77_dlatzm DLATZM
	#define f77_dlauu2 DLAUU2
	#define f77_dlauum DLAUUM
	#define f77_dlazq3 DLAZQ3
	#define f77_dlazq4 DLAZQ4
	#define f77_dopgtr DOPGTR
	#define f77_dopmtr DOPMTR
	#define f77_dorg2l DORG2L
	#define f77_dorg2r DORG2R
	#define f77_dorgbr DORGBR
	#define f77_dorghr DORGHR
	#define f77_dorgl2 DORGL2
	#define f77_dorglq DORGLQ
	#define f77_dorgql DORGQL
	#define f77_dorgqr DORGQR
	#define f77_dorgr2 DORGR2
	#define f77_dorgrq DORGRQ
	#define f77_dorgtr DORGTR
	#define f77_dorm2l DORM2L
	#define f77_dorm2r DORM2R
	#define f77_dormbr DORMBR
	#define f77_dormhr DORMHR
	#define f77_dorml2 DORML2
	#define f77_dormlq DORMLQ
	#define f77_dormql DORMQL
	#define f77_dormqr DORMQR
	#define f77_dormr2 DORMR2
	#define f77_dormr3 DORMR3
	#define f77_dormrq DORMRQ
	#define f77_dormrz DORMRZ
	#define f77_dormtr DORMTR
	#define f77_dpbcon DPBCON
	#define f77_dpbequ DPBEQU
	#define f77_dpbrfs DPBRFS
	#define f77_dpbstf DPBSTF
	#define f77_dpbsv DPBSV
	#define f77_dpbsvx DPBSVX
	#define f77_dpbtf2 DPBTF2
	#define f77_dpbtrf DPBTRF
	#define f77_dpbtrs DPBTRS
	#define f77_dpocon DPOCON
	#define f77_dpoequ DPOEQU
	#define f77_dporfs DPORFS
	#define f77_dposv DPOSV
	#define f77_dposvx DPOSVX
	#define f77_dpotf2 DPOTF2
	#define f77_dpotrf DPOTRF
	#define f77_dpotri DPOTRI
	#define f77_dpotrs DPOTRS
	#define f77_dppcon DPPCON
	#define f77_dppequ DPPEQU
	#define f77_dpprfs DPPRFS
	#define f77_dppsv DPPSV
	#define f77_dppsvx DPPSVX
	#define f77_dpptrf DPPTRF
	#define f77_dpptri DPPTRI
	#define f77_dpptrs DPPTRS
	#define f77_dptcon DPTCON
	#define f77_dpteqr DPTEQR
	#define f77_dptrfs DPTRFS
	#define f77_dptsv DPTSV
	#define f77_dptsvx DPTSVX
	#define f77_dpttrf DPTTRF
	#define f77_dpttrs DPTTRS
	#define f77_dptts2 DPTTS2
	#define f77_drscl DRSCL
	#define f77_dsbev DSBEV
	#define f77_dsbevd DSBEVD
	#define f77_dsbevx DSBEVX
	#define f77_dsbgst DSBGST
	#define f77_dsbgv DSBGV
	#define f77_dsbgvd DSBGVD
	#define f77_dsbgvx DSBGVX
	#define f77_dsbtrd DSBTRD
	#define f77_dsecnd DSECNDSUB
	#define f77_dspcon DSPCON
	#define f77_dspev DSPEV
	#define f77_dspevd DSPEVD
	#define f77_dspevx DSPEVX
	#define f77_dspgst DSPGST
	#define f77_dspgv DSPGV
	#define f77_dspgvd DSPGVD
	#define f77_dspgvx DSPGVX
	#define f77_dsprfs DSPRFS
	#define f77_dspsv DSPSV
	#define f77_dspsvx DSPSVX
	#define f77_dsptrd DSPTRD
	#define f77_dsptrf DSPTRF
	#define f77_dsptri DSPTRI
	#define f77_dsptrs DSPTRS
	#define f77_dstebz DSTEBZ
	#define f77_dstedc DSTEDC
	#define f77_dstegr DSTEGR
	#define f77_dstein DSTEIN
	#define f77_dsteqr DSTEQR
	#define f77_dsterf DSTERF
	#define f77_dstev DSTEV
	#define f77_dstevd DSTEVD
	#define f77_dstevr DSTEVR
	#define f77_dstevx DSTEVX
	#define f77_dsycon DSYCON
	#define f77_dsyev DSYEV
	#define f77_dsyevd DSYEVD
	#define f77_dsyevr DSYEVR
	#define f77_dsyevx DSYEVX
	#define f77_dsygs2 DSYGS2
	#define f77_dsygst DSYGST
	#define f77_dsygv DSYGV
	#define f77_dsygvd DSYGVD
	#define f77_dsygvx DSYGVX
	#define f77_dsyrfs DSYRFS
	#define f77_dsysv DSYSV
	#define f77_dsysvx DSYSVX
	#define f77_dsytd2 DSYTD2
	#define f77_dsytf2 DSYTF2
	#define f77_dsytrd DSYTRD
	#define f77_dsytrf DSYTRF
	#define f77_dsytri DSYTRI
	#define f77_dsytrs DSYTRS
	#define f77_dtbcon DTBCON
	#define f77_dtbrfs DTBRFS
	#define f77_dtbtrs DTBTRS
	#define f77_dtgevc DTGEVC
	#define f77_dtgex2 DTGEX2
	#define f77_dtgexc DTGEXC
	#define f77_dtgsen DTGSEN
	#define f77_dtgsja DTGSJA
	#define f77_dtgsna DTGSNA
	#define f77_dtgsy2 DTGSY2
	#define f77_dtgsyl DTGSYL
	#define f77_dtpcon DTPCON
	#define f77_dtprfs DTPRFS
	#define f77_dtptri DTPTRI
	#define f77_dtptrs DTPTRS
	#define f77_dtrcon DTRCON
	#define f77_dtrevc DTREVC
	#define f77_dtrexc DTREXC
	#define f77_dtrrfs DTRRFS
	#define f77_dtrsen DTRSEN
	#define f77_dtrsna DTRSNA
	#define f77_dtrsyl DTRSYL
	#define f77_dtrti2 DTRTI2
	#define f77_dtrtri DTRTRI
	#define f77_dtrtrs DTRTRS
	#define f77_dtzrqf DTZRQF
	#define f77_dtzrzf DTZRZF
	#define f77_dzsum1 DZSUM1SUB
	#define f77_icmax1 ICMAX1SUB
	#define f77_ieeeck IEEECKSUB
	#define f77_ilaenv ILAENVSUB
	#define f77_ilaver ILAVER
	#define f77_izmax1 IZMAX1SUB
	#define f77_lsame LSAMESUB
	#define f77_lsamen LSAMENSUB
	#define f77_sbdsdc SBDSDC
	#define f77_sbdsqr SBDSQR
	#define f77_scsum1 SCSUM1SUB
	#define f77_sdisna SDISNA
	#define f77_second SECONDSUB
	#define f77_sgbbrd SGBBRD
	#define f77_sgbcon SGBCON
	#define f77_sgbequ SGBEQU
	#define f77_sgbrfs SGBRFS
	#define f77_sgbsv SGBSV
	#define f77_sgbsvx SGBSVX
	#define f77_sgbtf2 SGBTF2
	#define f77_sgbtrf SGBTRF
	#define f77_sgbtrs SGBTRS
	#define f77_sgebak SGEBAK
	#define f77_sgebal SGEBAL
	#define f77_sgebd2 SGEBD2
	#define f77_sgebrd SGEBRD
	#define f77_sgecon SGECON
	#define f77_sgeequ SGEEQU
	#define f77_sgees SGEES
	#define f77_sgeesx SGEESX
	#define f77_sgeev SGEEV
	#define f77_sgeevx SGEEVX
	#define f77_sgegs SGEGS
	#define f77_sgegv SGEGV
	#define f77_sgehd2 SGEHD2
	#define f77_sgehrd SGEHRD
	#define f77_sgelq2 SGELQ2
	#define f77_sgelqf SGELQF
	#define f77_sgels SGELS
	#define f77_sgelsd SGELSD
	#define f77_sgelss SGELSS
	#define f77_sgelsx SGELSX
	#define f77_sgelsy SGELSY
	#define f77_sgeql2 SGEQL2
	#define f77_sgeqlf SGEQLF
	#define f77_sgeqp3 SGEQP3
	#define f77_sgeqpf SGEQPF
	#define f77_sgeqr2 SGEQR2
	#define f77_sgeqrf SGEQRF
	#define f77_sgerfs SGERFS
	#define f77_sgerq2 SGERQ2
	#define f77_sgerqf SGERQF
	#define f77_sgesc2 SGESC2
	#define f77_sgesdd SGESDD
	#define f77_sgesv SGESV
	#define f77_sgesvd SGESVD
	#define f77_sgesvx SGESVX
	#define f77_sgetc2 SGETC2
	#define f77_sgetf2 SGETF2
	#define f77_sgetrf SGETRF
	#define f77_sgetri SGETRI
	#define f77_sgetrs SGETRS
	#define f77_sggbak SGGBAK
	#define f77_sggbal SGGBAL
	#define f77_sgges SGGES
	#define f77_sggesx SGGESX
	#define f77_sggev SGGEV
	#define f77_sggevx SGGEVX
	#define f77_sggglm SGGGLM
	#define f77_sgghrd SGGHRD
	#define f77_sgglse SGGLSE
	#define f77_sggqrf SGGQRF
	#define f77_sggrqf SGGRQF
	#define f77_sggsvd SGGSVD
	#define f77_sggsvp SGGSVP
	#define f77_sgtcon SGTCON
	#define f77_sgtrfs SGTRFS
	#define f77_sgtsv SGTSV
	#define f77_sgtsvx SGTSVX
	#define f77_sgttrf SGTTRF
	#define f77_sgttrs SGTTRS
	#define f77_sgtts2 SGTTS2
	#define f77_shgeqz SHGEQZ
	#define f77_shsein SHSEIN
	#define f77_shseqr SHSEQR
	#define f77_slabad SLABAD
	#define f77_slabrd SLABRD
	#define f77_slacn2 SLACN2
	#define f77_slacon SLACON
	#define f77_slacpy SLACPY
	#define f77_sladiv SLADIV
	#define f77_slae2 SLAE2
	#define f77_slaebz SLAEBZ
	#define f77_slaed0 SLAED0
	#define f77_slaed1 SLAED1
	#define f77_slaed2 SLAED2
	#define f77_slaed3 SLAED3
	#define f77_slaed4 SLAED4
	#define f77_slaed5 SLAED5
	#define f77_slaed6 SLAED6
	#define f77_slaed7 SLAED7
	#define f77_slaed8 SLAED8
	#define f77_slaed9 SLAED9
	#define f77_slaeda SLAEDA
	#define f77_slaein SLAEIN
	#define f77_slaev2 SLAEV2
	#define f77_slaexc SLAEXC
	#define f77_slag2 SLAG2
	#define f77_slags2 SLAGS2
	#define f77_slagtf SLAGTF
	#define f77_slagtm SLAGTM
	#define f77_slagts SLAGTS
	#define f77_slagv2 SLAGV2
	#define f77_slahqr SLAHQR
	#define f77_slahrd SLAHRD
	#define f77_slaic1 SLAIC1
	#define f77_slaln2 SLALN2
	#define f77_slals0 SLALS0
	#define f77_slalsa SLALSA
	#define f77_slalsd SLALSD
	#define f77_slamch SLAMCHSUB
	#define f77_slamc1 SLAMC1
	#define f77_slamc2 SLAMC2
	#define f77_slamc3 SLAMC3SUB
	#define f77_slamc4 SLAMC4
	#define f77_slamc5 SLAMC5
	#define f77_slamrg SLAMRG
	#define f77_slangb SLANGBSUB
	#define f77_slange SLANGESUB
	#define f77_slangt SLANGTSUB
	#define f77_slanhs SLANHSSUB
	#define f77_slansb SLANSBSUB
	#define f77_slansp SLANSPSUB
	#define f77_slanst SLANSTSUB
	#define f77_slansy SLANSYSUB
	#define f77_slantb SLANTBSUB
	#define f77_slantp SLANTPSUB
	#define f77_slantr SLANTRSUB
	#define f77_slanv2 SLANV2
	#define f77_slapll SLAPLL
	#define f77_slapmt SLAPMT
	#define f77_slapy2 SLAPY2SUB
	#define f77_slapy3 SLAPY3SUB
	#define f77_slaqgb SLAQGB
	#define f77_slaqge SLAQGE
	#define f77_slaqp2 SLAQP2
	#define f77_slaqps SLAQPS
	#define f77_slaqsb SLAQSB
	#define f77_slaqsp SLAQSP
	#define f77_slaqsy SLAQSY
	#define f77_slaqtr SLAQTR
	#define f77_slar1v SLAR1V
	#define f77_slar2v SLAR2V
	#define f77_slarf SLARF
	#define f77_slarfb SLARFB
	#define f77_slarfg SLARFG
	#define f77_slarft SLARFT
	#define f77_slarfx SLARFX
	#define f77_slargv SLARGV
	#define f77_slarnv SLARNV
	#define f77_slarrb SLARRB
	#define f77_slarre SLARRE
	#define f77_slarrf SLARRF
	#define f77_slarrv SLARRV
	#define f77_slartg SLARTG
	#define f77_slartv SLARTV
	#define f77_slaruv SLARUV
	#define f77_slarz SLARZ
	#define f77_slarzb SLARZB
	#define f77_slarzt SLARZT
	#define f77_slas2 SLAS2
	#define f77_slascl SLASCL
	#define f77_slasd0 SLASD0
	#define f77_slasd1 SLASD1
	#define f77_slasd2 SLASD2
	#define f77_slasd3 SLASD3
	#define f77_slasd4 SLASD4
	#define f77_slasd5 SLASD5
	#define f77_slasd6 SLASD6
	#define f77_slasd7 SLASD7
	#define f77_slasd8 SLASD8
	#define f77_slasda SLASDA
	#define f77_slasdq SLASDQ
	#define f77_slasdt SLASDT
	#define f77_slaset SLASET
	#define f77_slasq1 SLASQ1
	#define f77_slasq2 SLASQ2
	#define f77_slasq3 SLASQ3
	#define f77_slasq4 SLASQ4
	#define f77_slasq5 SLASQ5
	#define f77_slasq6 SLASQ6
	#define f77_slasr SLASR
	#define f77_slasrt SLASRT
	#define f77_slassq SLASSQ
	#define f77_slasv2 SLASV2
	#define f77_slaswp SLASWP
	#define f77_slasy2 SLASY2
	#define f77_slasyf SLASYF
	#define f77_slatbs SLATBS
	#define f77_slatdf SLATDF
	#define f77_slatps SLATPS
	#define f77_slatrd SLATRD
	#define f77_slatrs SLATRS
	#define f77_slatrz SLATRZ
	#define f77_slatzm SLATZM
	#define f77_slauu2 SLAUU2
	#define f77_slauum SLAUUM
	#define f77_slazq3 SLAZQ3
	#define f77_slazq4 SLAZQ4
	#define f77_sopgtr SOPGTR
	#define f77_sopmtr SOPMTR
	#define f77_sorg2l SORG2L
	#define f77_sorg2r SORG2R
	#define f77_sorgbr SORGBR
	#define f77_sorghr SORGHR
	#define f77_sorgl2 SORGL2
	#define f77_sorglq SORGLQ
	#define f77_sorgql SORGQL
	#define f77_sorgqr SORGQR
	#define f77_sorgr2 SORGR2
	#define f77_sorgrq SORGRQ
	#define f77_sorgtr SORGTR
	#define f77_sorm2l SORM2L
	#define f77_sorm2r SORM2R
	#define f77_sormbr SORMBR
	#define f77_sormhr SORMHR
	#define f77_sorml2 SORML2
	#define f77_sormlq SORMLQ
	#define f77_sormql SORMQL
	#define f77_sormqr SORMQR
	#define f77_sormr2 SORMR2
	#define f77_sormr3 SORMR3
	#define f77_sormrq SORMRQ
	#define f77_sormrz SORMRZ
	#define f77_sormtr SORMTR
	#define f77_spbcon SPBCON
	#define f77_spbequ SPBEQU
	#define f77_spbrfs SPBRFS
	#define f77_spbstf SPBSTF
	#define f77_spbsv SPBSV
	#define f77_spbsvx SPBSVX
	#define f77_spbtf2 SPBTF2
	#define f77_spbtrf SPBTRF
	#define f77_spbtrs SPBTRS
	#define f77_spocon SPOCON
	#define f77_spoequ SPOEQU
	#define f77_sporfs SPORFS
	#define f77_sposv SPOSV
	#define f77_sposvx SPOSVX
	#define f77_spotf2 SPOTF2
	#define f77_spotrf SPOTRF
	#define f77_spotri SPOTRI
	#define f77_spotrs SPOTRS
	#define f77_sppcon SPPCON
	#define f77_sppequ SPPEQU
	#define f77_spprfs SPPRFS
	#define f77_sppsv SPPSV
	#define f77_sppsvx SPPSVX
	#define f77_spptrf SPPTRF
	#define f77_spptri SPPTRI
	#define f77_spptrs SPPTRS
	#define f77_sptcon SPTCON
	#define f77_spteqr SPTEQR
	#define f77_sptrfs SPTRFS
	#define f77_sptsv SPTSV
	#define f77_sptsvx SPTSVX
	#define f77_spttrf SPTTRF
	#define f77_spttrs SPTTRS
	#define f77_sptts2 SPTTS2
	#define f77_srscl SRSCL
	#define f77_ssbev SSBEV
	#define f77_ssbevd SSBEVD
	#define f77_ssbevx SSBEVX
	#define f77_ssbgst SSBGST
	#define f77_ssbgv SSBGV
	#define f77_ssbgvd SSBGVD
	#define f77_ssbgvx SSBGVX
	#define f77_ssbtrd SSBTRD
	#define f77_sspcon SSPCON
	#define f77_sspev SSPEV
	#define f77_sspevd SSPEVD
	#define f77_sspevx SSPEVX
	#define f77_sspgst SSPGST
	#define f77_sspgv SSPGV
	#define f77_sspgvd SSPGVD
	#define f77_sspgvx SSPGVX
	#define f77_ssprfs SSPRFS
	#define f77_sspsv SSPSV
	#define f77_sspsvx SSPSVX
	#define f77_ssptrd SSPTRD
	#define f77_ssptrf SSPTRF
	#define f77_ssptri SSPTRI
	#define f77_ssptrs SSPTRS
	#define f77_sstebz SSTEBZ
	#define f77_sstedc SSTEDC
	#define f77_sstegr SSTEGR
	#define f77_sstein SSTEIN
	#define f77_ssteqr SSTEQR
	#define f77_ssterf SSTERF
	#define f77_sstev SSTEV
	#define f77_sstevd SSTEVD
	#define f77_sstevr SSTEVR
	#define f77_sstevx SSTEVX
	#define f77_ssycon SSYCON
	#define f77_ssyev SSYEV
	#define f77_ssyevd SSYEVD
	#define f77_ssyevr SSYEVR
	#define f77_ssyevx SSYEVX
	#define f77_ssygs2 SSYGS2
	#define f77_ssygst SSYGST
	#define f77_ssygv SSYGV
	#define f77_ssygvd SSYGVD
	#define f77_ssygvx SSYGVX
	#define f77_ssyrfs SSYRFS
	#define f77_ssysv SSYSV
	#define f77_ssysvx SSYSVX
	#define f77_ssytd2 SSYTD2
	#define f77_ssytf2 SSYTF2
	#define f77_ssytrd SSYTRD
	#define f77_ssytrf SSYTRF
	#define f77_ssytri SSYTRI
	#define f77_ssytrs SSYTRS
	#define f77_stbcon STBCON
	#define f77_stbrfs STBRFS
	#define f77_stbtrs STBTRS
	#define f77_stgevc STGEVC
	#define f77_stgex2 STGEX2
	#define f77_stgexc STGEXC
	#define f77_stgsen STGSEN
	#define f77_stgsja STGSJA
	#define f77_stgsna STGSNA
	#define f77_stgsy2 STGSY2
	#define f77_stgsyl STGSYL
	#define f77_stpcon STPCON
	#define f77_stprfs STPRFS
	#define f77_stptri STPTRI
	#define f77_stptrs STPTRS
	#define f77_strcon STRCON
	#define f77_strevc STREVC
	#define f77_strexc STREXC
	#define f77_strrfs STRRFS
	#define f77_strsen STRSEN
	#define f77_strsna STRSNA
	#define f77_strsyl STRSYL
	#define f77_strti2 STRTI2
	#define f77_strtri STRTRI
	#define f77_strtrs STRTRS
	#define f77_stzrqf STZRQF
	#define f77_stzrzf STZRZF
	#define f77_xerbla XERBLA
	#define f77_zbdsqr ZBDSQR
	#define f77_zdrot ZDROT
	#define f77_zdrscl ZDRSCL
	#define f77_zgbbrd ZGBBRD
	#define f77_zgbcon ZGBCON
	#define f77_zgbequ ZGBEQU
	#define f77_zgbrfs ZGBRFS
	#define f77_zgbsv ZGBSV
	#define f77_zgbsvx ZGBSVX
	#define f77_zgbtf2 ZGBTF2
	#define f77_zgbtrf ZGBTRF
	#define f77_zgbtrs ZGBTRS
	#define f77_zgebak ZGEBAK
	#define f77_zgebal ZGEBAL
	#define f77_zgebd2 ZGEBD2
	#define f77_zgebrd ZGEBRD
	#define f77_zgecon ZGECON
	#define f77_zgeequ ZGEEQU
	#define f77_zgees ZGEES
	#define f77_zgeesx ZGEESX
	#define f77_zgeev ZGEEV
	#define f77_zgeevx ZGEEVX
	#define f77_zgegs ZGEGS
	#define f77_zgegv ZGEGV
	#define f77_zgehd2 ZGEHD2
	#define f77_zgehrd ZGEHRD
	#define f77_zgelq2 ZGELQ2
	#define f77_zgelqf ZGELQF
	#define f77_zgels ZGELS
	#define f77_zgelsd ZGELSD
	#define f77_zgelss ZGELSS
	#define f77_zgelsx ZGELSX
	#define f77_zgelsy ZGELSY
	#define f77_zgeql2 ZGEQL2
	#define f77_zgeqlf ZGEQLF
	#define f77_zgeqp3 ZGEQP3
	#define f77_zgeqpf ZGEQPF
	#define f77_zgeqr2 ZGEQR2
	#define f77_zgeqrf ZGEQRF
	#define f77_zgerfs ZGERFS
	#define f77_zgerq2 ZGERQ2
	#define f77_zgerqf ZGERQF
	#define f77_zgesc2 ZGESC2
	#define f77_zgesdd ZGESDD
	#define f77_zgesv ZGESV
	#define f77_zgesvd ZGESVD
	#define f77_zgesvx ZGESVX
	#define f77_zgetc2 ZGETC2
	#define f77_zgetf2 ZGETF2
	#define f77_zgetrf ZGETRF
	#define f77_zgetri ZGETRI
	#define f77_zgetrs ZGETRS
	#define f77_zggbak ZGGBAK
	#define f77_zggbal ZGGBAL
	#define f77_zgges ZGGES
	#define f77_zggesx ZGGESX
	#define f77_zggev ZGGEV
	#define f77_zggevx ZGGEVX
	#define f77_zggglm ZGGGLM
	#define f77_zgghrd ZGGHRD
	#define f77_zgglse ZGGLSE
	#define f77_zggqrf ZGGQRF
	#define f77_zggrqf ZGGRQF
	#define f77_zggsvd ZGGSVD
	#define f77_zggsvp ZGGSVP
	#define f77_zgtcon ZGTCON
	#define f77_zgtrfs ZGTRFS
	#define f77_zgtsv ZGTSV
	#define f77_zgtsvx ZGTSVX
	#define f77_zgttrf ZGTTRF
	#define f77_zgttrs ZGTTRS
	#define f77_zgtts2 ZGTTS2
	#define f77_zhbev ZHBEV
	#define f77_zhbevd ZHBEVD
	#define f77_zhbevx ZHBEVX
	#define f77_zhbgst ZHBGST
	#define f77_zhbgv ZHBGV
	#define f77_zhbgvd ZHBGVD
	#define f77_zhbgvx ZHBGVX
	#define f77_zhbtrd ZHBTRD
	#define f77_zhecon ZHECON
	#define f77_zheev ZHEEV
	#define f77_zheevd ZHEEVD
	#define f77_zheevr ZHEEVR
	#define f77_zheevx ZHEEVX
	#define f77_zhegs2 ZHEGS2
	#define f77_zhegst ZHEGST
	#define f77_zhegv ZHEGV
	#define f77_zhegvd ZHEGVD
	#define f77_zhegvx ZHEGVX
	#define f77_zherfs ZHERFS
	#define f77_zhesv ZHESV
	#define f77_zhesvx ZHESVX
	#define f77_zhetd2 ZHETD2
	#define f77_zhetf2 ZHETF2
	#define f77_zhetrd ZHETRD
	#define f77_zhetrf ZHETRF
	#define f77_zhetri ZHETRI
	#define f77_zhetrs ZHETRS
	#define f77_zhgeqz ZHGEQZ
	#define f77_zhpcon ZHPCON
	#define f77_zhpev ZHPEV
	#define f77_zhpevd ZHPEVD
	#define f77_zhpevx ZHPEVX
	#define f77_zhpgst ZHPGST
	#define f77_zhpgv ZHPGV
	#define f77_zhpgvd ZHPGVD
	#define f77_zhpgvx ZHPGVX
	#define f77_zhprfs ZHPRFS
	#define f77_zhpsv ZHPSV
	#define f77_zhpsvx ZHPSVX
	#define f77_zhptrd ZHPTRD
	#define f77_zhptrf ZHPTRF
	#define f77_zhptri ZHPTRI
	#define f77_zhptrs ZHPTRS
	#define f77_zhsein ZHSEIN
	#define f77_zhseqr ZHSEQR
	#define f77_zlabrd ZLABRD
	#define f77_zlacgv ZLACGV
	#define f77_zlacn2 ZLACN2
	#define f77_zlacon ZLACON
	#define f77_zlacp2 ZLACP2
	#define f77_zlacpy ZLACPY
	#define f77_zlacrm ZLACRM
	#define f77_zlacrt ZLACRT
	#define f77_zladiv ZLADIVSUB
	#define f77_zlaed0 ZLAED0
	#define f77_zlaed7 ZLAED7
	#define f77_zlaed8 ZLAED8
	#define f77_zlaein ZLAEIN
	#define f77_zlaesy ZLAESY
	#define f77_zlaev2 ZLAEV2
	#define f77_zlags2 ZLAGS2
	#define f77_zlagtm ZLAGTM
	#define f77_zlahef ZLAHEF
	#define f77_zlahqr ZLAHQR
	#define f77_zlahrd ZLAHRD
	#define f77_zlaic1 ZLAIC1
	#define f77_zlals0 ZLALS0
	#define f77_zlalsa ZLALSA
	#define f77_zlalsd ZLALSD
	#define f77_zlangb ZLANGBSUB
	#define f77_zlange ZLANGESUB
	#define f77_zlangt ZLANGTSUB
	#define f77_zlanhb ZLANHBSUB
	#define f77_zlanhe ZLANHESUB
	#define f77_zlanhp ZLANHPSUB
	#define f77_zlanhs ZLANHSSUB
	#define f77_zlanht ZLANHTSUB
	#define f77_zlansb ZLANSBSUB
	#define f77_zlansp ZLANSPSUB
	#define f77_zlansy ZLANSYSUB
	#define f77_zlantb ZLANTBSUB
	#define f77_zlantp ZLANTPSUB
	#define f77_zlantr ZLANTRSUB
	#define f77_zlapll ZLAPLL
	#define f77_zlapmt ZLAPMT
	#define f77_zlaqgb ZLAQGB
	#define f77_zlaqge ZLAQGE
	#define f77_zlaqhb ZLAQHB
	#define f77_zlaqhe ZLAQHE
	#define f77_zlaqhp ZLAQHP
	#define f77_zlaqp2 ZLAQP2
	#define f77_zlaqps ZLAQPS
	#define f77_zlaqsb ZLAQSB
	#define f77_zlaqsp ZLAQSP
	#define f77_zlaqsy ZLAQSY
	#define f77_zlar1v ZLAR1V
	#define f77_zlar2v ZLAR2V
	#define f77_zlarcm ZLARCM
	#define f77_zlarf ZLARF
	#define f77_zlarfb ZLARFB
	#define f77_zlarfg ZLARFG
	#define f77_zlarft ZLARFT
	#define f77_zlarfx ZLARFX
	#define f77_zlargv ZLARGV
	#define f77_zlarnv ZLARNV
	#define f77_zlarrv ZLARRV
	#define f77_zlartg ZLARTG
	#define f77_zlartv ZLARTV
	#define f77_zlarz ZLARZ
	#define f77_zlarzb ZLARZB
	#define f77_zlarzt ZLARZT
	#define f77_zlascl ZLASCL
	#define f77_zlaset ZLASET
	#define f77_zlasr ZLASR
	#define f77_zlassq ZLASSQ
	#define f77_zlaswp ZLASWP
	#define f77_zlasyf ZLASYF
	#define f77_zlatbs ZLATBS
	#define f77_zlatdf ZLATDF
	#define f77_zlatps ZLATPS
	#define f77_zlatrd ZLATRD
	#define f77_zlatrs ZLATRS
	#define f77_zlatrz ZLATRZ
	#define f77_zlatzm ZLATZM
	#define f77_zlauu2 ZLAUU2
	#define f77_zlauum ZLAUUM
	#define f77_zpbcon ZPBCON
	#define f77_zpbequ ZPBEQU
	#define f77_zpbrfs ZPBRFS
	#define f77_zpbstf ZPBSTF
	#define f77_zpbsv ZPBSV
	#define f77_zpbsvx ZPBSVX
	#define f77_zpbtf2 ZPBTF2
	#define f77_zpbtrf ZPBTRF
	#define f77_zpbtrs ZPBTRS
	#define f77_zpocon ZPOCON
	#define f77_zpoequ ZPOEQU
	#define f77_zporfs ZPORFS
	#define f77_zposv ZPOSV
	#define f77_zposvx ZPOSVX
	#define f77_zpotf2 ZPOTF2
	#define f77_zpotrf ZPOTRF
	#define f77_zpotri ZPOTRI
	#define f77_zpotrs ZPOTRS
	#define f77_zppcon ZPPCON
	#define f77_zppequ ZPPEQU
	#define f77_zpprfs ZPPRFS
	#define f77_zppsv ZPPSV
	#define f77_zppsvx ZPPSVX
	#define f77_zpptrf ZPPTRF
	#define f77_zpptri ZPPTRI
	#define f77_zpptrs ZPPTRS
	#define f77_zptcon ZPTCON
	#define f77_zpteqr ZPTEQR
	#define f77_zptrfs ZPTRFS
	#define f77_zptsv ZPTSV
	#define f77_zptsvx ZPTSVX
	#define f77_zpttrf ZPTTRF
	#define f77_zpttrs ZPTTRS
	#define f77_zptts2 ZPTTS2
	#define f77_zrot ZROT
	#define f77_zspcon ZSPCON
	#define f77_zspmv ZSPMV
	#define f77_zspr ZSPR
	#define f77_zsprfs ZSPRFS
	#define f77_zspsv ZSPSV
	#define f77_zspsvx ZSPSVX
	#define f77_zsptrf ZSPTRF
	#define f77_zsptri ZSPTRI
	#define f77_zsptrs ZSPTRS
	#define f77_zstedc ZSTEDC
	#define f77_zstegr ZSTEGR
	#define f77_zstein ZSTEIN
	#define f77_zsteqr ZSTEQR
	#define f77_zsycon ZSYCON
	#define f77_zsymv ZSYMV
	#define f77_zsyr ZSYR
	#define f77_zsyrfs ZSYRFS
	#define f77_zsysv ZSYSV
	#define f77_zsysvx ZSYSVX
	#define f77_zsytf2 ZSYTF2
	#define f77_zsytrf ZSYTRF
	#define f77_zsytri ZSYTRI
	#define f77_zsytrs ZSYTRS
	#define f77_ztbcon ZTBCON
	#define f77_ztbrfs ZTBRFS
	#define f77_ztbtrs ZTBTRS
	#define f77_ztgevc ZTGEVC
	#define f77_ztgex2 ZTGEX2
	#define f77_ztgexc ZTGEXC
	#define f77_ztgsen ZTGSEN
	#define f77_ztgsja ZTGSJA
	#define f77_ztgsna ZTGSNA
	#define f77_ztgsy2 ZTGSY2
	#define f77_ztgsyl ZTGSYL
	#define f77_ztpcon ZTPCON
	#define f77_ztprfs ZTPRFS
	#define f77_ztptri ZTPTRI
	#define f77_ztptrs ZTPTRS
	#define f77_ztrcon ZTRCON
	#define f77_ztrevc ZTREVC
	#define f77_ztrexc ZTREXC
	#define f77_ztrrfs ZTRRFS
	#define f77_ztrsen ZTRSEN
	#define f77_ztrsna ZTRSNA
	#define f77_ztrsyl ZTRSYL
	#define f77_ztrti2 ZTRTI2
	#define f77_ztrtri ZTRTRI
	#define f77_ztrtrs ZTRTRS
	#define f77_ztzrqf ZTZRQF
	#define f77_ztzrzf ZTZRZF
	#define f77_zung2l ZUNG2L
	#define f77_zung2r ZUNG2R
	#define f77_zungbr ZUNGBR
	#define f77_zunghr ZUNGHR
	#define f77_zungl2 ZUNGL2
	#define f77_zunglq ZUNGLQ
	#define f77_zungql ZUNGQL
	#define f77_zungqr ZUNGQR
	#define f77_zungr2 ZUNGR2
	#define f77_zungrq ZUNGRQ
	#define f77_zungtr ZUNGTR
	#define f77_zunm2l ZUNM2L
	#define f77_zunm2r ZUNM2R
	#define f77_zunmbr ZUNMBR
	#define f77_zunmhr ZUNMHR
	#define f77_zunml2 ZUNML2
	#define f77_zunmlq ZUNMLQ
	#define f77_zunmql ZUNMQL
	#define f77_zunmqr ZUNMQR
	#define f77_zunmr2 ZUNMR2
	#define f77_zunmr3 ZUNMR3
	#define f77_zunmrq ZUNMRQ
	#define f77_zunmrz ZUNMRZ
	#define f77_zunmtr ZUNMTR
	#define f77_zupgtr ZUPGTR
	#define f77_zupmtr ZUPMTR
#elif defined(NOCHANGE)
	#define f77_cbdsqr cbdsqr
	#define f77_cgbbrd cgbbrd
	#define f77_cgbcon cgbcon
	#define f77_cgbequ cgbequ
	#define f77_cgbrfs cgbrfs
	#define f77_cgbsv cgbsv
	#define f77_cgbsvx cgbsvx
	#define f77_cgbtf2 cgbtf2
	#define f77_cgbtrf cgbtrf
	#define f77_cgbtrs cgbtrs
	#define f77_cgebak cgebak
	#define f77_cgebal cgebal
	#define f77_cgebd2 cgebd2
	#define f77_cgebrd cgebrd
	#define f77_cgecon cgecon
	#define f77_cgeequ cgeequ
	#define f77_cgees cgees
	#define f77_cgeesx cgeesx
	#define f77_cgeev cgeev
	#define f77_cgeevx cgeevx
	#define f77_cgegs cgegs
	#define f77_cgegv cgegv
	#define f77_cgehd2 cgehd2
	#define f77_cgehrd cgehrd
	#define f77_cgelq2 cgelq2
	#define f77_cgelqf cgelqf
	#define f77_cgels cgels
	#define f77_cgelsd cgelsd
	#define f77_cgelss cgelss
	#define f77_cgelsx cgelsx
	#define f77_cgelsy cgelsy
	#define f77_cgeql2 cgeql2
	#define f77_cgeqlf cgeqlf
	#define f77_cgeqp3 cgeqp3
	#define f77_cgeqpf cgeqpf
	#define f77_cgeqr2 cgeqr2
	#define f77_cgeqrf cgeqrf
	#define f77_cgerfs cgerfs
	#define f77_cgerq2 cgerq2
	#define f77_cgerqf cgerqf
	#define f77_cgesc2 cgesc2
	#define f77_cgesdd cgesdd
	#define f77_cgesv cgesv
	#define f77_cgesvd cgesvd
	#define f77_cgesvx cgesvx
	#define f77_cgetc2 cgetc2
	#define f77_cgetf2 cgetf2
	#define f77_cgetrf cgetrf
	#define f77_cgetri cgetri
	#define f77_cgetrs cgetrs
	#define f77_cggbak cggbak
	#define f77_cggbal cggbal
	#define f77_cgges cgges
	#define f77_cggesx cggesx
	#define f77_cggev cggev
	#define f77_cggevx cggevx
	#define f77_cggglm cggglm
	#define f77_cgghrd cgghrd
	#define f77_cgglse cgglse
	#define f77_cggqrf cggqrf
	#define f77_cggrqf cggrqf
	#define f77_cggsvd cggsvd
	#define f77_cggsvp cggsvp
	#define f77_cgtcon cgtcon
	#define f77_cgtrfs cgtrfs
	#define f77_cgtsv cgtsv
	#define f77_cgtsvx cgtsvx
	#define f77_cgttrf cgttrf
	#define f77_cgttrs cgttrs
	#define f77_cgtts2 cgtts2
	#define f77_chbev chbev
	#define f77_chbevd chbevd
	#define f77_chbevx chbevx
	#define f77_chbgst chbgst
	#define f77_chbgv chbgv
	#define f77_chbgvd chbgvd
	#define f77_chbgvx chbgvx
	#define f77_chbtrd chbtrd
	#define f77_checon checon
	#define f77_cheev cheev
	#define f77_cheevd cheevd
	#define f77_cheevr cheevr
	#define f77_cheevx cheevx
	#define f77_chegs2 chegs2
	#define f77_chegst chegst
	#define f77_chegv chegv
	#define f77_chegvd chegvd
	#define f77_chegvx chegvx
	#define f77_cherfs cherfs
	#define f77_chesv chesv
	#define f77_chesvx chesvx
	#define f77_chetd2 chetd2
	#define f77_chetf2 chetf2
	#define f77_chetrd chetrd
	#define f77_chetrf chetrf
	#define f77_chetri chetri
	#define f77_chetrs chetrs
	#define f77_chgeqz chgeqz
	#define f77_chpcon chpcon
	#define f77_chpev chpev
	#define f77_chpevd chpevd
	#define f77_chpevx chpevx
	#define f77_chpgst chpgst
	#define f77_chpgv chpgv
	#define f77_chpgvd chpgvd
	#define f77_chpgvx chpgvx
	#define f77_chprfs chprfs
	#define f77_chpsv chpsv
	#define f77_chpsvx chpsvx
	#define f77_chptrd chptrd
	#define f77_chptrf chptrf
	#define f77_chptri chptri
	#define f77_chptrs chptrs
	#define f77_chsein chsein
	#define f77_chseqr chseqr
	#define f77_clabrd clabrd
	#define f77_clacgv clacgv
	#define f77_clacn2 clacn2
	#define f77_clacon clacon
	#define f77_clacp2 clacp2
	#define f77_clacpy clacpy
	#define f77_clacrm clacrm
	#define f77_clacrt clacrt
	#define f77_cladiv cladivsub
	#define f77_claed0 claed0
	#define f77_claed7 claed7
	#define f77_claed8 claed8
	#define f77_claein claein
	#define f77_claesy claesy
	#define f77_claev2 claev2
	#define f77_clags2 clags2
	#define f77_clagtm clagtm
	#define f77_clahef clahef
	#define f77_clahqr clahqr
	#define f77_clahrd clahrd
	#define f77_claic1 claic1
	#define f77_clals0 clals0
	#define f77_clalsa clalsa
	#define f77_clalsd clalsd
	#define f77_clangb clangbsub
	#define f77_clange clangesub
	#define f77_clangt clangtsub
	#define f77_clanhb clanhbsub
	#define f77_clanhe clanhesub
	#define f77_clanhp clanhpsub
	#define f77_clanhs clanhssub
	#define f77_clanht clanhtsub
	#define f77_clansb clansbsub
	#define f77_clansp clanspsub
	#define f77_clansy clansysub
	#define f77_clantb clantbsub
	#define f77_clantp clantpsub
	#define f77_clantr clantrsub
	#define f77_clapll clapll
	#define f77_clapmt clapmt
	#define f77_claqgb claqgb
	#define f77_claqge claqge
	#define f77_claqhb claqhb
	#define f77_claqhe claqhe
	#define f77_claqhp claqhp
	#define f77_claqp2 claqp2
	#define f77_claqps claqps
	#define f77_claqsb claqsb
	#define f77_claqsp claqsp
	#define f77_claqsy claqsy
	#define f77_clar1v clar1v
	#define f77_clar2v clar2v
	#define f77_clarcm clarcm
	#define f77_clarf clarf
	#define f77_clarfb clarfb
	#define f77_clarfg clarfg
	#define f77_clarft clarft
	#define f77_clarfx clarfx
	#define f77_clargv clargv
	#define f77_clarnv clarnv
	#define f77_clarrv clarrv
	#define f77_clartg clartg
	#define f77_clartv clartv
	#define f77_clarz clarz
	#define f77_clarzb clarzb
	#define f77_clarzt clarzt
	#define f77_clascl clascl
	#define f77_claset claset
	#define f77_clasr clasr
	#define f77_classq classq
	#define f77_claswp claswp
	#define f77_clasyf clasyf
	#define f77_clatbs clatbs
	#define f77_clatdf clatdf
	#define f77_clatps clatps
	#define f77_clatrd clatrd
	#define f77_clatrs clatrs
	#define f77_clatrz clatrz
	#define f77_clatzm clatzm
	#define f77_clauu2 clauu2
	#define f77_clauum clauum
	#define f77_cpbcon cpbcon
	#define f77_cpbequ cpbequ
	#define f77_cpbrfs cpbrfs
	#define f77_cpbstf cpbstf
	#define f77_cpbsv cpbsv
	#define f77_cpbsvx cpbsvx
	#define f77_cpbtf2 cpbtf2
	#define f77_cpbtrf cpbtrf
	#define f77_cpbtrs cpbtrs
	#define f77_cpocon cpocon
	#define f77_cpoequ cpoequ
	#define f77_cporfs cporfs
	#define f77_cposv cposv
	#define f77_cposvx cposvx
	#define f77_cpotf2 cpotf2
	#define f77_cpotrf cpotrf
	#define f77_cpotri cpotri
	#define f77_cpotrs cpotrs
	#define f77_cppcon cppcon
	#define f77_cppequ cppequ
	#define f77_cpprfs cpprfs
	#define f77_cppsv cppsv
	#define f77_cppsvx cppsvx
	#define f77_cpptrf cpptrf
	#define f77_cpptri cpptri
	#define f77_cpptrs cpptrs
	#define f77_cptcon cptcon
	#define f77_cpteqr cpteqr
	#define f77_cptrfs cptrfs
	#define f77_cptsv cptsv
	#define f77_cptsvx cptsvx
	#define f77_cpttrf cpttrf
	#define f77_cpttrs cpttrs
	#define f77_cptts2 cptts2
	#define f77_crot crot
	#define f77_cspcon cspcon
	#define f77_cspmv cspmv
	#define f77_cspr cspr
	#define f77_csprfs csprfs
	#define f77_cspsv cspsv
	#define f77_cspsvx cspsvx
	#define f77_csptrf csptrf
	#define f77_csptri csptri
	#define f77_csptrs csptrs
	#define f77_csrot csrot
	#define f77_csrscl csrscl
	#define f77_cstedc cstedc
	#define f77_cstegr cstegr
	#define f77_cstein cstein
	#define f77_csteqr csteqr
	#define f77_csycon csycon
	#define f77_csymv csymv
	#define f77_csyr csyr
	#define f77_csyrfs csyrfs
	#define f77_csysv csysv
	#define f77_csysvx csysvx
	#define f77_csytf2 csytf2
	#define f77_csytrf csytrf
	#define f77_csytri csytri
	#define f77_csytrs csytrs
	#define f77_ctbcon ctbcon
	#define f77_ctbrfs ctbrfs
	#define f77_ctbtrs ctbtrs
	#define f77_ctgevc ctgevc
	#define f77_ctgex2 ctgex2
	#define f77_ctgexc ctgexc
	#define f77_ctgsen ctgsen
	#define f77_ctgsja ctgsja
	#define f77_ctgsna ctgsna
	#define f77_ctgsy2 ctgsy2
	#define f77_ctgsyl ctgsyl
	#define f77_ctpcon ctpcon
	#define f77_ctprfs ctprfs
	#define f77_ctptri ctptri
	#define f77_ctptrs ctptrs
	#define f77_ctrcon ctrcon
	#define f77_ctrevc ctrevc
	#define f77_ctrexc ctrexc
	#define f77_ctrrfs ctrrfs
	#define f77_ctrsen ctrsen
	#define f77_ctrsna ctrsna
	#define f77_ctrsyl ctrsyl
	#define f77_ctrti2 ctrti2
	#define f77_ctrtri ctrtri
	#define f77_ctrtrs ctrtrs
	#define f77_ctzrqf ctzrqf
	#define f77_ctzrzf ctzrzf
	#define f77_cung2l cung2l
	#define f77_cung2r cung2r
	#define f77_cungbr cungbr
	#define f77_cunghr cunghr
	#define f77_cungl2 cungl2
	#define f77_cunglq cunglq
	#define f77_cungql cungql
	#define f77_cungqr cungqr
	#define f77_cungr2 cungr2
	#define f77_cungrq cungrq
	#define f77_cungtr cungtr
	#define f77_cunm2l cunm2l
	#define f77_cunm2r cunm2r
	#define f77_cunmbr cunmbr
	#define f77_cunmhr cunmhr
	#define f77_cunml2 cunml2
	#define f77_cunmlq cunmlq
	#define f77_cunmql cunmql
	#define f77_cunmqr cunmqr
	#define f77_cunmr2 cunmr2
	#define f77_cunmr3 cunmr3
	#define f77_cunmrq cunmrq
	#define f77_cunmrz cunmrz
	#define f77_cunmtr cunmtr
	#define f77_cupgtr cupgtr
	#define f77_cupmtr cupmtr
	#define f77_dbdsdc dbdsdc
	#define f77_dbdsqr dbdsqr
	#define f77_ddisna ddisna
	#define f77_dgbbrd dgbbrd
	#define f77_dgbcon dgbcon
	#define f77_dgbequ dgbequ
	#define f77_dgbrfs dgbrfs
	#define f77_dgbsv dgbsv
	#define f77_dgbsvx dgbsvx
	#define f77_dgbtf2 dgbtf2
	#define f77_dgbtrf dgbtrf
	#define f77_dgbtrs dgbtrs
	#define f77_dgebak dgebak
	#define f77_dgebal dgebal
	#define f77_dgebd2 dgebd2
	#define f77_dgebrd dgebrd
	#define f77_dgecon dgecon
	#define f77_dgeequ dgeequ
	#define f77_dgees dgees
	#define f77_dgeesx dgeesx
	#define f77_dgeev dgeev
	#define f77_dgeevx dgeevx
	#define f77_dgegs dgegs
	#define f77_dgegv dgegv
	#define f77_dgehd2 dgehd2
	#define f77_dgehrd dgehrd
	#define f77_dgelq2 dgelq2
	#define f77_dgelqf dgelqf
	#define f77_dgels dgels
	#define f77_dgelsd dgelsd
	#define f77_dgelss dgelss
	#define f77_dgelsx dgelsx
	#define f77_dgelsy dgelsy
	#define f77_dgeql2 dgeql2
	#define f77_dgeqlf dgeqlf
	#define f77_dgeqp3 dgeqp3
	#define f77_dgeqpf dgeqpf
	#define f77_dgeqr2 dgeqr2
	#define f77_dgeqrf dgeqrf
	#define f77_dgerfs dgerfs
	#define f77_dgerq2 dgerq2
	#define f77_dgerqf dgerqf
	#define f77_dgesc2 dgesc2
	#define f77_dgesdd dgesdd
	#define f77_dgesv dgesv
	#define f77_dgesvd dgesvd
	#define f77_dgesvx dgesvx
	#define f77_dgetc2 dgetc2
	#define f77_dgetf2 dgetf2
	#define f77_dgetrf dgetrf
	#define f77_dgetri dgetri
	#define f77_dgetrs dgetrs
	#define f77_dggbak dggbak
	#define f77_dggbal dggbal
	#define f77_dgges dgges
	#define f77_dggesx dggesx
	#define f77_dggev dggev
	#define f77_dggevx dggevx
	#define f77_dggglm dggglm
	#define f77_dgghrd dgghrd
	#define f77_dgglse dgglse
	#define f77_dggqrf dggqrf
	#define f77_dggrqf dggrqf
	#define f77_dggsvd dggsvd
	#define f77_dggsvp dggsvp
	#define f77_dgtcon dgtcon
	#define f77_dgtrfs dgtrfs
	#define f77_dgtsv dgtsv
	#define f77_dgtsvx dgtsvx
	#define f77_dgttrf dgttrf
	#define f77_dgttrs dgttrs
	#define f77_dgtts2 dgtts2
	#define f77_dhgeqz dhgeqz
	#define f77_dhsein dhsein
	#define f77_dhseqr dhseqr
	#define f77_dlabad dlabad
	#define f77_dlabrd dlabrd
	#define f77_dlacn2 dlacn2
	#define f77_dlacon dlacon
	#define f77_dlacpy dlacpy
	#define f77_dladiv dladiv
	#define f77_dlae2 dlae2
	#define f77_dlaebz dlaebz
	#define f77_dlaed0 dlaed0
	#define f77_dlaed1 dlaed1
	#define f77_dlaed2 dlaed2
	#define f77_dlaed3 dlaed3
	#define f77_dlaed4 dlaed4
	#define f77_dlaed5 dlaed5
	#define f77_dlaed6 dlaed6
	#define f77_dlaed7 dlaed7
	#define f77_dlaed8 dlaed8
	#define f77_dlaed9 dlaed9
	#define f77_dlaeda dlaeda
	#define f77_dlaein dlaein
	#define f77_dlaev2 dlaev2
	#define f77_dlaexc dlaexc
	#define f77_dlag2 dlag2
	#define f77_dlags2 dlags2
	#define f77_dlagtf dlagtf
	#define f77_dlagtm dlagtm
	#define f77_dlagts dlagts
	#define f77_dlagv2 dlagv2
	#define f77_dlahqr dlahqr
	#define f77_dlahrd dlahrd
	#define f77_dlaic1 dlaic1
	#define f77_dlaln2 dlaln2
	#define f77_dlals0 dlals0
	#define f77_dlalsa dlalsa
	#define f77_dlalsd dlalsd
	#define f77_dlamch dlamchsub
	#define f77_dlamc1 dlamc1
	#define f77_dlamc2 dlamc2
	#define f77_dlamc3 dlamc3sub
	#define f77_dlamc4 dlamc4
	#define f77_dlamc5 dlamc5
	#define f77_dlamrg dlamrg
	#define f77_dlangb dlangbsub
	#define f77_dlange dlangesub
	#define f77_dlangt dlangtsub
	#define f77_dlanhs dlanhssub
	#define f77_dlansb dlansbsub
	#define f77_dlansp dlanspsub
	#define f77_dlanst dlanstsub
	#define f77_dlansy dlansysub
	#define f77_dlantb dlantbsub
	#define f77_dlantp dlantpsub
	#define f77_dlantr dlantrsub
	#define f77_dlanv2 dlanv2
	#define f77_dlapll dlapll
	#define f77_dlapmt dlapmt
	#define f77_dlapy2 dlapy2sub
	#define f77_dlapy3 dlapy3sub
	#define f77_dlaqgb dlaqgb
	#define f77_dlaqge dlaqge
	#define f77_dlaqp2 dlaqp2
	#define f77_dlaqps dlaqps
	#define f77_dlaqsb dlaqsb
	#define f77_dlaqsp dlaqsp
	#define f77_dlaqsy dlaqsy
	#define f77_dlaqtr dlaqtr
	#define f77_dlar1v dlar1v
	#define f77_dlar2v dlar2v
	#define f77_dlarf dlarf
	#define f77_dlarfb dlarfb
	#define f77_dlarfg dlarfg
	#define f77_dlarft dlarft
	#define f77_dlarfx dlarfx
	#define f77_dlargv dlargv
	#define f77_dlarnv dlarnv
	#define f77_dlarrb dlarrb
	#define f77_dlarre dlarre
	#define f77_dlarrf dlarrf
	#define f77_dlarrv dlarrv
	#define f77_dlartg dlartg
	#define f77_dlartv dlartv
	#define f77_dlaruv dlaruv
	#define f77_dlarz dlarz
	#define f77_dlarzb dlarzb
	#define f77_dlarzt dlarzt
	#define f77_dlas2 dlas2
	#define f77_dlascl dlascl
	#define f77_dlasd0 dlasd0
	#define f77_dlasd1 dlasd1
	#define f77_dlasd2 dlasd2
	#define f77_dlasd3 dlasd3
	#define f77_dlasd4 dlasd4
	#define f77_dlasd5 dlasd5
	#define f77_dlasd6 dlasd6
	#define f77_dlasd7 dlasd7
	#define f77_dlasd8 dlasd8
	#define f77_dlasda dlasda
	#define f77_dlasdq dlasdq
	#define f77_dlasdt dlasdt
	#define f77_dlaset dlaset
	#define f77_dlasq1 dlasq1
	#define f77_dlasq2 dlasq2
	#define f77_dlasq3 dlasq3
	#define f77_dlasq4 dlasq4
	#define f77_dlasq5 dlasq5
	#define f77_dlasq6 dlasq6
	#define f77_dlasr dlasr
	#define f77_dlasrt dlasrt
	#define f77_dlassq dlassq
	#define f77_dlasv2 dlasv2
	#define f77_dlaswp dlaswp
	#define f77_dlasy2 dlasy2
	#define f77_dlasyf dlasyf
	#define f77_dlatbs dlatbs
	#define f77_dlatdf dlatdf
	#define f77_dlatps dlatps
	#define f77_dlatrd dlatrd
	#define f77_dlatrs dlatrs
	#define f77_dlatrz dlatrz
	#define f77_dlatzm dlatzm
	#define f77_dlauu2 dlauu2
	#define f77_dlauum dlauum
	#define f77_dlazq3 dlazq3
	#define f77_dlazq4 dlazq4
	#define f77_dopgtr dopgtr
	#define f77_dopmtr dopmtr
	#define f77_dorg2l dorg2l
	#define f77_dorg2r dorg2r
	#define f77_dorgbr dorgbr
	#define f77_dorghr dorghr
	#define f77_dorgl2 dorgl2
	#define f77_dorglq dorglq
	#define f77_dorgql dorgql
	#define f77_dorgqr dorgqr
	#define f77_dorgr2 dorgr2
	#define f77_dorgrq dorgrq
	#define f77_dorgtr dorgtr
	#define f77_dorm2l dorm2l
	#define f77_dorm2r dorm2r
	#define f77_dormbr dormbr
	#define f77_dormhr dormhr
	#define f77_dorml2 dorml2
	#define f77_dormlq dormlq
	#define f77_dormql dormql
	#define f77_dormqr dormqr
	#define f77_dormr2 dormr2
	#define f77_dormr3 dormr3
	#define f77_dormrq dormrq
	#define f77_dormrz dormrz
	#define f77_dormtr dormtr
	#define f77_dpbcon dpbcon
	#define f77_dpbequ dpbequ
	#define f77_dpbrfs dpbrfs
	#define f77_dpbstf dpbstf
	#define f77_dpbsv dpbsv
	#define f77_dpbsvx dpbsvx
	#define f77_dpbtf2 dpbtf2
	#define f77_dpbtrf dpbtrf
	#define f77_dpbtrs dpbtrs
	#define f77_dpocon dpocon
	#define f77_dpoequ dpoequ
	#define f77_dporfs dporfs
	#define f77_dposv dposv
	#define f77_dposvx dposvx
	#define f77_dpotf2 dpotf2
	#define f77_dpotrf dpotrf
	#define f77_dpotri dpotri
	#define f77_dpotrs dpotrs
	#define f77_dppcon dppcon
	#define f77_dppequ dppequ
	#define f77_dpprfs dpprfs
	#define f77_dppsv dppsv
	#define f77_dppsvx dppsvx
	#define f77_dpptrf dpptrf
	#define f77_dpptri dpptri
	#define f77_dpptrs dpptrs
	#define f77_dptcon dptcon
	#define f77_dpteqr dpteqr
	#define f77_dptrfs dptrfs
	#define f77_dptsv dptsv
	#define f77_dptsvx dptsvx
	#define f77_dpttrf dpttrf
	#define f77_dpttrs dpttrs
	#define f77_dptts2 dptts2
	#define f77_drscl drscl
	#define f77_dsbev dsbev
	#define f77_dsbevd dsbevd
	#define f77_dsbevx dsbevx
	#define f77_dsbgst dsbgst
	#define f77_dsbgv dsbgv
	#define f77_dsbgvd dsbgvd
	#define f77_dsbgvx dsbgvx
	#define f77_dsbtrd dsbtrd
	#define f77_dsecnd dsecndsub
	#define f77_dspcon dspcon
	#define f77_dspev dspev
	#define f77_dspevd dspevd
	#define f77_dspevx dspevx
	#define f77_dspgst dspgst
	#define f77_dspgv dspgv
	#define f77_dspgvd dspgvd
	#define f77_dspgvx dspgvx
	#define f77_dsprfs dsprfs
	#define f77_dspsv dspsv
	#define f77_dspsvx dspsvx
	#define f77_dsptrd dsptrd
	#define f77_dsptrf dsptrf
	#define f77_dsptri dsptri
	#define f77_dsptrs dsptrs
	#define f77_dstebz dstebz
	#define f77_dstedc dstedc
	#define f77_dstegr dstegr
	#define f77_dstein dstein
	#define f77_dsteqr dsteqr
	#define f77_dsterf dsterf
	#define f77_dstev dstev
	#define f77_dstevd dstevd
	#define f77_dstevr dstevr
	#define f77_dstevx dstevx
	#define f77_dsycon dsycon
	#define f77_dsyev dsyev
	#define f77_dsyevd dsyevd
	#define f77_dsyevr dsyevr
	#define f77_dsyevx dsyevx
	#define f77_dsygs2 dsygs2
	#define f77_dsygst dsygst
	#define f77_dsygv dsygv
	#define f77_dsygvd dsygvd
	#define f77_dsygvx dsygvx
	#define f77_dsyrfs dsyrfs
	#define f77_dsysv dsysv
	#define f77_dsysvx dsysvx
	#define f77_dsytd2 dsytd2
	#define f77_dsytf2 dsytf2
	#define f77_dsytrd dsytrd
	#define f77_dsytrf dsytrf
	#define f77_dsytri dsytri
	#define f77_dsytrs dsytrs
	#define f77_dtbcon dtbcon
	#define f77_dtbrfs dtbrfs
	#define f77_dtbtrs dtbtrs
	#define f77_dtgevc dtgevc
	#define f77_dtgex2 dtgex2
	#define f77_dtgexc dtgexc
	#define f77_dtgsen dtgsen
	#define f77_dtgsja dtgsja
	#define f77_dtgsna dtgsna
	#define f77_dtgsy2 dtgsy2
	#define f77_dtgsyl dtgsyl
	#define f77_dtpcon dtpcon
	#define f77_dtprfs dtprfs
	#define f77_dtptri dtptri
	#define f77_dtptrs dtptrs
	#define f77_dtrcon dtrcon
	#define f77_dtrevc dtrevc
	#define f77_dtrexc dtrexc
	#define f77_dtrrfs dtrrfs
	#define f77_dtrsen dtrsen
	#define f77_dtrsna dtrsna
	#define f77_dtrsyl dtrsyl
	#define f77_dtrti2 dtrti2
	#define f77_dtrtri dtrtri
	#define f77_dtrtrs dtrtrs
	#define f77_dtzrqf dtzrqf
	#define f77_dtzrzf dtzrzf
	#define f77_dzsum1 dzsum1sub
	#define f77_icmax1 icmax1sub
	#define f77_ieeeck ieeecksub
	#define f77_ilaenv ilaenvsub
	#define f77_ilaver ilaver
	#define f77_izmax1 izmax1sub
	#define f77_lsame lsamesub
	#define f77_lsamen lsamensub
	#define f77_sbdsdc sbdsdc
	#define f77_sbdsqr sbdsqr
	#define f77_scsum1 scsum1sub
	#define f77_sdisna sdisna
	#define f77_second secondsub
	#define f77_sgbbrd sgbbrd
	#define f77_sgbcon sgbcon
	#define f77_sgbequ sgbequ
	#define f77_sgbrfs sgbrfs
	#define f77_sgbsv sgbsv
	#define f77_sgbsvx sgbsvx
	#define f77_sgbtf2 sgbtf2
	#define f77_sgbtrf sgbtrf
	#define f77_sgbtrs sgbtrs
	#define f77_sgebak sgebak
	#define f77_sgebal sgebal
	#define f77_sgebd2 sgebd2
	#define f77_sgebrd sgebrd
	#define f77_sgecon sgecon
	#define f77_sgeequ sgeequ
	#define f77_sgees sgees
	#define f77_sgeesx sgeesx
	#define f77_sgeev sgeev
	#define f77_sgeevx sgeevx
	#define f77_sgegs sgegs
	#define f77_sgegv sgegv
	#define f77_sgehd2 sgehd2
	#define f77_sgehrd sgehrd
	#define f77_sgelq2 sgelq2
	#define f77_sgelqf sgelqf
	#define f77_sgels sgels
	#define f77_sgelsd sgelsd
	#define f77_sgelss sgelss
	#define f77_sgelsx sgelsx
	#define f77_sgelsy sgelsy
	#define f77_sgeql2 sgeql2
	#define f77_sgeqlf sgeqlf
	#define f77_sgeqp3 sgeqp3
	#define f77_sgeqpf sgeqpf
	#define f77_sgeqr2 sgeqr2
	#define f77_sgeqrf sgeqrf
	#define f77_sgerfs sgerfs
	#define f77_sgerq2 sgerq2
	#define f77_sgerqf sgerqf
	#define f77_sgesc2 sgesc2
	#define f77_sgesdd sgesdd
	#define f77_sgesv sgesv
	#define f77_sgesvd sgesvd
	#define f77_sgesvx sgesvx
	#define f77_sgetc2 sgetc2
	#define f77_sgetf2 sgetf2
	#define f77_sgetrf sgetrf
	#define f77_sgetri sgetri
	#define f77_sgetrs sgetrs
	#define f77_sggbak sggbak
	#define f77_sggbal sggbal
	#define f77_sgges sgges
	#define f77_sggesx sggesx
	#define f77_sggev sggev
	#define f77_sggevx sggevx
	#define f77_sggglm sggglm
	#define f77_sgghrd sgghrd
	#define f77_sgglse sgglse
	#define f77_sggqrf sggqrf
	#define f77_sggrqf sggrqf
	#define f77_sggsvd sggsvd
	#define f77_sggsvp sggsvp
	#define f77_sgtcon sgtcon
	#define f77_sgtrfs sgtrfs
	#define f77_sgtsv sgtsv
	#define f77_sgtsvx sgtsvx
	#define f77_sgttrf sgttrf
	#define f77_sgttrs sgttrs
	#define f77_sgtts2 sgtts2
	#define f77_shgeqz shgeqz
	#define f77_shsein shsein
	#define f77_shseqr shseqr
	#define f77_slabad slabad
	#define f77_slabrd slabrd
	#define f77_slacn2 slacn2
	#define f77_slacon slacon
	#define f77_slacpy slacpy
	#define f77_sladiv sladiv
	#define f77_slae2 slae2
	#define f77_slaebz slaebz
	#define f77_slaed0 slaed0
	#define f77_slaed1 slaed1
	#define f77_slaed2 slaed2
	#define f77_slaed3 slaed3
	#define f77_slaed4 slaed4
	#define f77_slaed5 slaed5
	#define f77_slaed6 slaed6
	#define f77_slaed7 slaed7
	#define f77_slaed8 slaed8
	#define f77_slaed9 slaed9
	#define f77_slaeda slaeda
	#define f77_slaein slaein
	#define f77_slaev2 slaev2
	#define f77_slaexc slaexc
	#define f77_slag2 slag2
	#define f77_slags2 slags2
	#define f77_slagtf slagtf
	#define f77_slagtm slagtm
	#define f77_slagts slagts
	#define f77_slagv2 slagv2
	#define f77_slahqr slahqr
	#define f77_slahrd slahrd
	#define f77_slaic1 slaic1
	#define f77_slaln2 slaln2
	#define f77_slals0 slals0
	#define f77_slalsa slalsa
	#define f77_slalsd slalsd
	#define f77_slamch slamchsub
	#define f77_slamc1 slamc1
	#define f77_slamc2 slamc2
	#define f77_slamc3 slamc3sub
	#define f77_slamc4 slamc4
	#define f77_slamc5 slamc5
	#define f77_slamrg slamrg
	#define f77_slangb slangbsub
	#define f77_slange slangesub
	#define f77_slangt slangtsub
	#define f77_slanhs slanhssub
	#define f77_slansb slansbsub
	#define f77_slansp slanspsub
	#define f77_slanst slanstsub
	#define f77_slansy slansysub
	#define f77_slantb slantbsub
	#define f77_slantp slantpsub
	#define f77_slantr slantrsub
	#define f77_slanv2 slanv2
	#define f77_slapll slapll
	#define f77_slapmt slapmt
	#define f77_slapy2 slapy2sub
	#define f77_slapy3 slapy3sub
	#define f77_slaqgb slaqgb
	#define f77_slaqge slaqge
	#define f77_slaqp2 slaqp2
	#define f77_slaqps slaqps
	#define f77_slaqsb slaqsb
	#define f77_slaqsp slaqsp
	#define f77_slaqsy slaqsy
	#define f77_slaqtr slaqtr
	#define f77_slar1v slar1v
	#define f77_slar2v slar2v
	#define f77_slarf slarf
	#define f77_slarfb slarfb
	#define f77_slarfg slarfg
	#define f77_slarft slarft
	#define f77_slarfx slarfx
	#define f77_slargv slargv
	#define f77_slarnv slarnv
	#define f77_slarrb slarrb
	#define f77_slarre slarre
	#define f77_slarrf slarrf
	#define f77_slarrv slarrv
	#define f77_slartg slartg
	#define f77_slartv slartv
	#define f77_slaruv slaruv
	#define f77_slarz slarz
	#define f77_slarzb slarzb
	#define f77_slarzt slarzt
	#define f77_slas2 slas2
	#define f77_slascl slascl
	#define f77_slasd0 slasd0
	#define f77_slasd1 slasd1
	#define f77_slasd2 slasd2
	#define f77_slasd3 slasd3
	#define f77_slasd4 slasd4
	#define f77_slasd5 slasd5
	#define f77_slasd6 slasd6
	#define f77_slasd7 slasd7
	#define f77_slasd8 slasd8
	#define f77_slasda slasda
	#define f77_slasdq slasdq
	#define f77_slasdt slasdt
	#define f77_slaset slaset
	#define f77_slasq1 slasq1
	#define f77_slasq2 slasq2
	#define f77_slasq3 slasq3
	#define f77_slasq4 slasq4
	#define f77_slasq5 slasq5
	#define f77_slasq6 slasq6
	#define f77_slasr slasr
	#define f77_slasrt slasrt
	#define f77_slassq slassq
	#define f77_slasv2 slasv2
	#define f77_slaswp slaswp
	#define f77_slasy2 slasy2
	#define f77_slasyf slasyf
	#define f77_slatbs slatbs
	#define f77_slatdf slatdf
	#define f77_slatps slatps
	#define f77_slatrd slatrd
	#define f77_slatrs slatrs
	#define f77_slatrz slatrz
	#define f77_slatzm slatzm
	#define f77_slauu2 slauu2
	#define f77_slauum slauum
	#define f77_slazq3 slazq3
	#define f77_slazq4 slazq4
	#define f77_sopgtr sopgtr
	#define f77_sopmtr sopmtr
	#define f77_sorg2l sorg2l
	#define f77_sorg2r sorg2r
	#define f77_sorgbr sorgbr
	#define f77_sorghr sorghr
	#define f77_sorgl2 sorgl2
	#define f77_sorglq sorglq
	#define f77_sorgql sorgql
	#define f77_sorgqr sorgqr
	#define f77_sorgr2 sorgr2
	#define f77_sorgrq sorgrq
	#define f77_sorgtr sorgtr
	#define f77_sorm2l sorm2l
	#define f77_sorm2r sorm2r
	#define f77_sormbr sormbr
	#define f77_sormhr sormhr
	#define f77_sorml2 sorml2
	#define f77_sormlq sormlq
	#define f77_sormql sormql
	#define f77_sormqr sormqr
	#define f77_sormr2 sormr2
	#define f77_sormr3 sormr3
	#define f77_sormrq sormrq
	#define f77_sormrz sormrz
	#define f77_sormtr sormtr
	#define f77_spbcon spbcon
	#define f77_spbequ spbequ
	#define f77_spbrfs spbrfs
	#define f77_spbstf spbstf
	#define f77_spbsv spbsv
	#define f77_spbsvx spbsvx
	#define f77_spbtf2 spbtf2
	#define f77_spbtrf spbtrf
	#define f77_spbtrs spbtrs
	#define f77_spocon spocon
	#define f77_spoequ spoequ
	#define f77_sporfs sporfs
	#define f77_sposv sposv
	#define f77_sposvx sposvx
	#define f77_spotf2 spotf2
	#define f77_spotrf spotrf
	#define f77_spotri spotri
	#define f77_spotrs spotrs
	#define f77_sppcon sppcon
	#define f77_sppequ sppequ
	#define f77_spprfs spprfs
	#define f77_sppsv sppsv
	#define f77_sppsvx sppsvx
	#define f77_spptrf spptrf
	#define f77_spptri spptri
	#define f77_spptrs spptrs
	#define f77_sptcon sptcon
	#define f77_spteqr spteqr
	#define f77_sptrfs sptrfs
	#define f77_sptsv sptsv
	#define f77_sptsvx sptsvx
	#define f77_spttrf spttrf
	#define f77_spttrs spttrs
	#define f77_sptts2 sptts2
	#define f77_srscl srscl
	#define f77_ssbev ssbev
	#define f77_ssbevd ssbevd
	#define f77_ssbevx ssbevx
	#define f77_ssbgst ssbgst
	#define f77_ssbgv ssbgv
	#define f77_ssbgvd ssbgvd
	#define f77_ssbgvx ssbgvx
	#define f77_ssbtrd ssbtrd
	#define f77_sspcon sspcon
	#define f77_sspev sspev
	#define f77_sspevd sspevd
	#define f77_sspevx sspevx
	#define f77_sspgst sspgst
	#define f77_sspgv sspgv
	#define f77_sspgvd sspgvd
	#define f77_sspgvx sspgvx
	#define f77_ssprfs ssprfs
	#define f77_sspsv sspsv
	#define f77_sspsvx sspsvx
	#define f77_ssptrd ssptrd
	#define f77_ssptrf ssptrf
	#define f77_ssptri ssptri
	#define f77_ssptrs ssptrs
	#define f77_sstebz sstebz
	#define f77_sstedc sstedc
	#define f77_sstegr sstegr
	#define f77_sstein sstein
	#define f77_ssteqr ssteqr
	#define f77_ssterf ssterf
	#define f77_sstev sstev
	#define f77_sstevd sstevd
	#define f77_sstevr sstevr
	#define f77_sstevx sstevx
	#define f77_ssycon ssycon
	#define f77_ssyev ssyev
	#define f77_ssyevd ssyevd
	#define f77_ssyevr ssyevr
	#define f77_ssyevx ssyevx
	#define f77_ssygs2 ssygs2
	#define f77_ssygst ssygst
	#define f77_ssygv ssygv
	#define f77_ssygvd ssygvd
	#define f77_ssygvx ssygvx
	#define f77_ssyrfs ssyrfs
	#define f77_ssysv ssysv
	#define f77_ssysvx ssysvx
	#define f77_ssytd2 ssytd2
	#define f77_ssytf2 ssytf2
	#define f77_ssytrd ssytrd
	#define f77_ssytrf ssytrf
	#define f77_ssytri ssytri
	#define f77_ssytrs ssytrs
	#define f77_stbcon stbcon
	#define f77_stbrfs stbrfs
	#define f77_stbtrs stbtrs
	#define f77_stgevc stgevc
	#define f77_stgex2 stgex2
	#define f77_stgexc stgexc
	#define f77_stgsen stgsen
	#define f77_stgsja stgsja
	#define f77_stgsna stgsna
	#define f77_stgsy2 stgsy2
	#define f77_stgsyl stgsyl
	#define f77_stpcon stpcon
	#define f77_stprfs stprfs
	#define f77_stptri stptri
	#define f77_stptrs stptrs
	#define f77_strcon strcon
	#define f77_strevc strevc
	#define f77_strexc strexc
	#define f77_strrfs strrfs
	#define f77_strsen strsen
	#define f77_strsna strsna
	#define f77_strsyl strsyl
	#define f77_strti2 strti2
	#define f77_strtri strtri
	#define f77_strtrs strtrs
	#define f77_stzrqf stzrqf
	#define f77_stzrzf stzrzf
	#define f77_xerbla xerbla
	#define f77_zbdsqr zbdsqr
	#define f77_zdrot zdrot
	#define f77_zdrscl zdrscl
	#define f77_zgbbrd zgbbrd
	#define f77_zgbcon zgbcon
	#define f77_zgbequ zgbequ
	#define f77_zgbrfs zgbrfs
	#define f77_zgbsv zgbsv
	#define f77_zgbsvx zgbsvx
	#define f77_zgbtf2 zgbtf2
	#define f77_zgbtrf zgbtrf
	#define f77_zgbtrs zgbtrs
	#define f77_zgebak zgebak
	#define f77_zgebal zgebal
	#define f77_zgebd2 zgebd2
	#define f77_zgebrd zgebrd
	#define f77_zgecon zgecon
	#define f77_zgeequ zgeequ
	#define f77_zgees zgees
	#define f77_zgeesx zgeesx
	#define f77_zgeev zgeev
	#define f77_zgeevx zgeevx
	#define f77_zgegs zgegs
	#define f77_zgegv zgegv
	#define f77_zgehd2 zgehd2
	#define f77_zgehrd zgehrd
	#define f77_zgelq2 zgelq2
	#define f77_zgelqf zgelqf
	#define f77_zgels zgels
	#define f77_zgelsd zgelsd
	#define f77_zgelss zgelss
	#define f77_zgelsx zgelsx
	#define f77_zgelsy zgelsy
	#define f77_zgeql2 zgeql2
	#define f77_zgeqlf zgeqlf
	#define f77_zgeqp3 zgeqp3
	#define f77_zgeqpf zgeqpf
	#define f77_zgeqr2 zgeqr2
	#define f77_zgeqrf zgeqrf
	#define f77_zgerfs zgerfs
	#define f77_zgerq2 zgerq2
	#define f77_zgerqf zgerqf
	#define f77_zgesc2 zgesc2
	#define f77_zgesdd zgesdd
	#define f77_zgesv zgesv
	#define f77_zgesvd zgesvd
	#define f77_zgesvx zgesvx
	#define f77_zgetc2 zgetc2
	#define f77_zgetf2 zgetf2
	#define f77_zgetrf zgetrf
	#define f77_zgetri zgetri
	#define f77_zgetrs zgetrs
	#define f77_zggbak zggbak
	#define f77_zggbal zggbal
	#define f77_zgges zgges
	#define f77_zggesx zggesx
	#define f77_zggev zggev
	#define f77_zggevx zggevx
	#define f77_zggglm zggglm
	#define f77_zgghrd zgghrd
	#define f77_zgglse zgglse
	#define f77_zggqrf zggqrf
	#define f77_zggrqf zggrqf
	#define f77_zggsvd zggsvd
	#define f77_zggsvp zggsvp
	#define f77_zgtcon zgtcon
	#define f77_zgtrfs zgtrfs
	#define f77_zgtsv zgtsv
	#define f77_zgtsvx zgtsvx
	#define f77_zgttrf zgttrf
	#define f77_zgttrs zgttrs
	#define f77_zgtts2 zgtts2
	#define f77_zhbev zhbev
	#define f77_zhbevd zhbevd
	#define f77_zhbevx zhbevx
	#define f77_zhbgst zhbgst
	#define f77_zhbgv zhbgv
	#define f77_zhbgvd zhbgvd
	#define f77_zhbgvx zhbgvx
	#define f77_zhbtrd zhbtrd
	#define f77_zhecon zhecon
	#define f77_zheev zheev
	#define f77_zheevd zheevd
	#define f77_zheevr zheevr
	#define f77_zheevx zheevx
	#define f77_zhegs2 zhegs2
	#define f77_zhegst zhegst
	#define f77_zhegv zhegv
	#define f77_zhegvd zhegvd
	#define f77_zhegvx zhegvx
	#define f77_zherfs zherfs
	#define f77_zhesv zhesv
	#define f77_zhesvx zhesvx
	#define f77_zhetd2 zhetd2
	#define f77_zhetf2 zhetf2
	#define f77_zhetrd zhetrd
	#define f77_zhetrf zhetrf
	#define f77_zhetri zhetri
	#define f77_zhetrs zhetrs
	#define f77_zhgeqz zhgeqz
	#define f77_zhpcon zhpcon
	#define f77_zhpev zhpev
	#define f77_zhpevd zhpevd
	#define f77_zhpevx zhpevx
	#define f77_zhpgst zhpgst
	#define f77_zhpgv zhpgv
	#define f77_zhpgvd zhpgvd
	#define f77_zhpgvx zhpgvx
	#define f77_zhprfs zhprfs
	#define f77_zhpsv zhpsv
	#define f77_zhpsvx zhpsvx
	#define f77_zhptrd zhptrd
	#define f77_zhptrf zhptrf
	#define f77_zhptri zhptri
	#define f77_zhptrs zhptrs
	#define f77_zhsein zhsein
	#define f77_zhseqr zhseqr
	#define f77_zlabrd zlabrd
	#define f77_zlacgv zlacgv
	#define f77_zlacn2 zlacn2
	#define f77_zlacon zlacon
	#define f77_zlacp2 zlacp2
	#define f77_zlacpy zlacpy
	#define f77_zlacrm zlacrm
	#define f77_zlacrt zlacrt
	#define f77_zladiv zladivsub
	#define f77_zlaed0 zlaed0
	#define f77_zlaed7 zlaed7
	#define f77_zlaed8 zlaed8
	#define f77_zlaein zlaein
	#define f77_zlaesy zlaesy
	#define f77_zlaev2 zlaev2
	#define f77_zlags2 zlags2
	#define f77_zlagtm zlagtm
	#define f77_zlahef zlahef
	#define f77_zlahqr zlahqr
	#define f77_zlahrd zlahrd
	#define f77_zlaic1 zlaic1
	#define f77_zlals0 zlals0
	#define f77_zlalsa zlalsa
	#define f77_zlalsd zlalsd
	#define f77_zlangb zlangbsub
	#define f77_zlange zlangesub
	#define f77_zlangt zlangtsub
	#define f77_zlanhb zlanhbsub
	#define f77_zlanhe zlanhesub
	#define f77_zlanhp zlanhpsub
	#define f77_zlanhs zlanhssub
	#define f77_zlanht zlanhtsub
	#define f77_zlansb zlansbsub
	#define f77_zlansp zlanspsub
	#define f77_zlansy zlansysub
	#define f77_zlantb zlantbsub
	#define f77_zlantp zlantpsub
	#define f77_zlantr zlantrsub
	#define f77_zlapll zlapll
	#define f77_zlapmt zlapmt
	#define f77_zlaqgb zlaqgb
	#define f77_zlaqge zlaqge
	#define f77_zlaqhb zlaqhb
	#define f77_zlaqhe zlaqhe
	#define f77_zlaqhp zlaqhp
	#define f77_zlaqp2 zlaqp2
	#define f77_zlaqps zlaqps
	#define f77_zlaqsb zlaqsb
	#define f77_zlaqsp zlaqsp
	#define f77_zlaqsy zlaqsy
	#define f77_zlar1v zlar1v
	#define f77_zlar2v zlar2v
	#define f77_zlarcm zlarcm
	#define f77_zlarf zlarf
	#define f77_zlarfb zlarfb
	#define f77_zlarfg zlarfg
	#define f77_zlarft zlarft
	#define f77_zlarfx zlarfx
	#define f77_zlargv zlargv
	#define f77_zlarnv zlarnv
	#define f77_zlarrv zlarrv
	#define f77_zlartg zlartg
	#define f77_zlartv zlartv
	#define f77_zlarz zlarz
	#define f77_zlarzb zlarzb
	#define f77_zlarzt zlarzt
	#define f77_zlascl zlascl
	#define f77_zlaset zlaset
	#define f77_zlasr zlasr
	#define f77_zlassq zlassq
	#define f77_zlaswp zlaswp
	#define f77_zlasyf zlasyf
	#define f77_zlatbs zlatbs
	#define f77_zlatdf zlatdf
	#define f77_zlatps zlatps
	#define f77_zlatrd zlatrd
	#define f77_zlatrs zlatrs
	#define f77_zlatrz zlatrz
	#define f77_zlatzm zlatzm
	#define f77_zlauu2 zlauu2
	#define f77_zlauum zlauum
	#define f77_zpbcon zpbcon
	#define f77_zpbequ zpbequ
	#define f77_zpbrfs zpbrfs
	#define f77_zpbstf zpbstf
	#define f77_zpbsv zpbsv
	#define f77_zpbsvx zpbsvx
	#define f77_zpbtf2 zpbtf2
	#define f77_zpbtrf zpbtrf
	#define f77_zpbtrs zpbtrs
	#define f77_zpocon zpocon
	#define f77_zpoequ zpoequ
	#define f77_zporfs zporfs
	#define f77_zposv zposv
	#define f77_zposvx zposvx
	#define f77_zpotf2 zpotf2
	#define f77_zpotrf zpotrf
	#define f77_zpotri zpotri
	#define f77_zpotrs zpotrs
	#define f77_zppcon zppcon
	#define f77_zppequ zppequ
	#define f77_zpprfs zpprfs
	#define f77_zppsv zppsv
	#define f77_zppsvx zppsvx
	#define f77_zpptrf zpptrf
	#define f77_zpptri zpptri
	#define f77_zpptrs zpptrs
	#define f77_zptcon zptcon
	#define f77_zpteqr zpteqr
	#define f77_zptrfs zptrfs
	#define f77_zptsv zptsv
	#define f77_zptsvx zptsvx
	#define f77_zpttrf zpttrf
	#define f77_zpttrs zpttrs
	#define f77_zptts2 zptts2
	#define f77_zrot zrot
	#define f77_zspcon zspcon
	#define f77_zspmv zspmv
	#define f77_zspr zspr
	#define f77_zsprfs zsprfs
	#define f77_zspsv zspsv
	#define f77_zspsvx zspsvx
	#define f77_zsptrf zsptrf
	#define f77_zsptri zsptri
	#define f77_zsptrs zsptrs
	#define f77_zstedc zstedc
	#define f77_zstegr zstegr
	#define f77_zstein zstein
	#define f77_zsteqr zsteqr
	#define f77_zsycon zsycon
	#define f77_zsymv zsymv
	#define f77_zsyr zsyr
	#define f77_zsyrfs zsyrfs
	#define f77_zsysv zsysv
	#define f77_zsysvx zsysvx
	#define f77_zsytf2 zsytf2
	#define f77_zsytrf zsytrf
	#define f77_zsytri zsytri
	#define f77_zsytrs zsytrs
	#define f77_ztbcon ztbcon
	#define f77_ztbrfs ztbrfs
	#define f77_ztbtrs ztbtrs
	#define f77_ztgevc ztgevc
	#define f77_ztgex2 ztgex2
	#define f77_ztgexc ztgexc
	#define f77_ztgsen ztgsen
	#define f77_ztgsja ztgsja
	#define f77_ztgsna ztgsna
	#define f77_ztgsy2 ztgsy2
	#define f77_ztgsyl ztgsyl
	#define f77_ztpcon ztpcon
	#define f77_ztprfs ztprfs
	#define f77_ztptri ztptri
	#define f77_ztptrs ztptrs
	#define f77_ztrcon ztrcon
	#define f77_ztrevc ztrevc
	#define f77_ztrexc ztrexc
	#define f77_ztrrfs ztrrfs
	#define f77_ztrsen ztrsen
	#define f77_ztrsna ztrsna
	#define f77_ztrsyl ztrsyl
	#define f77_ztrti2 ztrti2
	#define f77_ztrtri ztrtri
	#define f77_ztrtrs ztrtrs
	#define f77_ztzrqf ztzrqf
	#define f77_ztzrzf ztzrzf
	#define f77_zung2l zung2l
	#define f77_zung2r zung2r
	#define f77_zungbr zungbr
	#define f77_zunghr zunghr
	#define f77_zungl2 zungl2
	#define f77_zunglq zunglq
	#define f77_zungql zungql
	#define f77_zungqr zungqr
	#define f77_zungr2 zungr2
	#define f77_zungrq zungrq
	#define f77_zungtr zungtr
	#define f77_zunm2l zunm2l
	#define f77_zunm2r zunm2r
	#define f77_zunmbr zunmbr
	#define f77_zunmhr zunmhr
	#define f77_zunml2 zunml2
	#define f77_zunmlq zunmlq
	#define f77_zunmql zunmql
	#define f77_zunmqr zunmqr
	#define f77_zunmr2 zunmr2
	#define f77_zunmr3 zunmr3
	#define f77_zunmrq zunmrq
	#define f77_zunmrz zunmrz
	#define f77_zunmtr zunmtr
	#define f77_zupgtr zupgtr
	#define f77_zupmtr zupmtr
#endif

#ifdef F77_INT
	#define FINT const F77_INT *
	#define FINT2 F77_INT *
#else
	#define FINT const int *
	#define FINT2 int *
#endif

#ifdef F77_LOG
	#define FLOG const F77_LOG *
	#define FLOG2 F77_LOG *
#else
	#define FLOG const long int *
	#define FLOG2 long int *
#endif

#ifdef  F77_CHAR
	#define FCHAR F77_CHAR
#else
	#define FCHAR char *
#endif

#define C2F_CHAR(a) ( _cptofcd( (a), 1 ) )

#define C2F_STR(a, i) ( _cptofcd( (a), (i) ) )

void f77_cbdsqr(const FCHAR uplo, FINT n, FINT ncvt, FINT nru, FINT ncc, float * d, float * e, void * vt, FINT ldvt, void * u, FINT ldu, void * c, FINT ldc, float * rwork, FINT2 info);
void f77_cgbbrd(const FCHAR vect, FINT m, FINT n, FINT ncc, FINT kl, FINT ku, void * ab, FINT ldab, float * d, float * e, void * q, FINT ldq, void * pt, FINT ldpt, void * c, FINT ldc, void * work, float * rwork, FINT2 info);
void f77_cgbcon(const FCHAR norm, FINT n, FINT kl, FINT ku, const void * ab, FINT ldab, FINT ipiv, const float * anorm, float * rcond, void * work, float * rwork, FINT2 info);
void f77_cgbequ(FINT m, FINT n, FINT kl, FINT ku, const void * ab, FINT ldab, float * r, float * c, float * rowcnd, float * colcnd, float * amax, FINT2 info);
void f77_cgbrfs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const void * ab, FINT ldab, const void * afb, FINT ldafb, FINT ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cgbsv(FINT n, FINT kl, FINT ku, FINT nrhs, void * ab, FINT ldab, FINT2 ipiv, void * b, FINT ldb, FINT2 info);
void f77_cgbsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, void * ab, FINT ldab, void * afb, FINT ldafb, FINT2 ipiv, FCHAR equed, float * r, float * c, void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cgbtf2(FINT m, FINT n, FINT kl, FINT ku, void * ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_cgbtrf(FINT m, FINT n, FINT kl, FINT ku, void * ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_cgbtrs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const void * ab, FINT ldab, FINT ipiv, void * b, FINT ldb, FINT2 info);
void f77_cgebak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const float * scale, FINT m, void * v, FINT ldv, FINT2 info);
void f77_cgebal(const FCHAR job, FINT n, void * a, FINT lda, FINT2 ilo, FINT2 ihi, float * scale, FINT2 info);
void f77_cgebd2(FINT m, FINT n, void * a, FINT lda, float * d, float * e, void * tauq, void * taup, void * work, FINT2 info);
void f77_cgebrd(FINT m, FINT n, void * a, FINT lda, float * d, float * e, void * tauq, void * taup, void * work, FINT lwork, FINT2 info);
void f77_cgecon(const FCHAR norm, FINT n, const void * a, FINT lda, const float * anorm, float * rcond, void * work, float * rwork, FINT2 info);
void f77_cgeequ(FINT m, FINT n, const void * a, FINT lda, float * r, float * c, float * rowcnd, float * colcnd, float * amax, FINT2 info);
void f77_cgees(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (void*), FINT n, void * a, FINT lda, FINT2 sdim, void * w, void * vs, FINT ldvs, void * work, FINT lwork, float * rwork, long int * bwork, FINT2 info);
void f77_cgeesx(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (void*), const FCHAR sense, FINT n, void * a, FINT lda, FINT2 sdim, void * w, void * vs, FINT ldvs, float * rconde, float * rcondv, void * work, FINT lwork, float * rwork, long int * bwork, FINT2 info);
void f77_cgeev(const FCHAR jobvl, const FCHAR jobvr, FINT n, void * a, FINT lda, void * w, void * vl, FINT ldvl, void * vr, FINT ldvr, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgeevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, void * a, FINT lda, void * w, void * vl, FINT ldvl, void * vr, FINT ldvr, FINT2 ilo, FINT2 ihi, float * scale, float * abnrm, float * rconde, float * rcondv, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgegs(const FCHAR jobvsl, const FCHAR jobvsr, FINT n, void * a, FINT lda, void * b, FINT ldb, void * alpha, void * beta, void * vsl, FINT ldvsl, void * vsr, FINT ldvsr, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgegv(const FCHAR jobvl, const FCHAR jobvr, FINT n, void * a, FINT lda, void * b, FINT ldb, void * alpha, void * beta, void * vl, FINT ldvl, void * vr, FINT ldvr, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgehd2(FINT n, FINT ilo, FINT ihi, void * a, FINT lda, void * tau, void * work, FINT2 info);
void f77_cgehrd(FINT n, FINT ilo, FINT ihi, void * a, FINT lda, void * tau, void * work, FINT lwork, FINT2 info);
void f77_cgelq2(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT2 info);
void f77_cgelqf(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT lwork, FINT2 info);
void f77_cgels(const FCHAR trans, FINT m, FINT n, FINT nrhs, void * a, FINT lda, void * b, FINT ldb, void * work, FINT lwork, FINT2 info);
void f77_cgelsd(FINT m, FINT n, FINT nrhs, void * a, FINT lda, void * b, FINT ldb, float * s, const float * rcond, FINT2 rank, void * work, FINT lwork, float * rwork, FINT2 iwork, FINT2 info);
void f77_cgelss(FINT m, FINT n, FINT nrhs, void * a, FINT lda, void * b, FINT ldb, float * s, const float * rcond, FINT2 rank, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgelsx(FINT m, FINT n, FINT nrhs, void * a, FINT lda, void * b, FINT ldb, FINT2 jpvt, const float * rcond, FINT2 rank, void * work, float * rwork, FINT2 info);
void f77_cgelsy(FINT m, FINT n, FINT nrhs, void * a, FINT lda, void * b, FINT ldb, FINT2 jpvt, const float * rcond, FINT2 rank, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgeql2(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT2 info);
void f77_cgeqlf(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT lwork, FINT2 info);
void f77_cgeqp3(FINT m, FINT n, void * a, FINT lda, FINT2 jpvt, void * tau, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgeqpf(FINT m, FINT n, void * a, FINT lda, FINT2 jpvt, void * tau, void * work, float * rwork, FINT2 info);
void f77_cgeqr2(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT2 info);
void f77_cgeqrf(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT lwork, FINT2 info);
void f77_cgerfs(const FCHAR trans, FINT n, FINT nrhs, const void * a, FINT lda, const void * af, FINT ldaf, FINT ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cgerq2(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT2 info);
void f77_cgerqf(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT lwork, FINT2 info);
void f77_cgesc2(FINT n, const void * a, FINT lda, void * rhs, FINT ipiv, FINT jpiv, float * scale);
void f77_cgesdd(const FCHAR jobz, FINT m, FINT n, void * a, FINT lda, float * s, void * u, FINT ldu, void * vt, FINT ldvt, void * work, FINT lwork, float * rwork, FINT2 iwork, FINT2 info);
void f77_cgesv(FINT n, FINT nrhs, void * a, FINT lda, FINT2 ipiv, void * b, FINT ldb, FINT2 info);
void f77_cgesvd(const FCHAR jobu, const FCHAR jobvt, FINT m, FINT n, void * a, FINT lda, float * s, void * u, FINT ldu, void * vt, FINT ldvt, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cgesvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, void * a, FINT lda, void * af, FINT ldaf, FINT2 ipiv, FCHAR equed, float * r, float * c, void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cgetc2(FINT n, void * a, FINT lda, FINT2 ipiv, FINT2 jpiv, FINT2 info);
void f77_cgetf2(FINT m, FINT n, void * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_cgetrf(FINT m, FINT n, void * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_cgetri(FINT n, void * a, FINT lda, FINT ipiv, void * work, FINT lwork, FINT2 info);
void f77_cgetrs(const FCHAR trans, FINT n, FINT nrhs, const void * a, FINT lda, FINT ipiv, void * b, FINT ldb, FINT2 info);
void f77_cggbak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const float * lscale, const float * rscale, FINT m, void * v, FINT ldv, FINT2 info);
void f77_cggbal(const FCHAR job, FINT n, void * a, FINT lda, void * b, FINT ldb, FINT2 ilo, FINT2 ihi, float * lscale, float * rscale, float * work, FINT2 info);
void f77_cgges(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (void*,void*), FINT n, void * a, FINT lda, void * b, FINT ldb, FINT2 sdim, void * alpha, void * beta, void * vsl, FINT ldvsl, void * vsr, FINT ldvsr, void * work, FINT lwork, float * rwork, long int * bwork, FINT2 info);
void f77_cggesx(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (void*,void*), const FCHAR sense, FINT n, void * a, FINT lda, void * b, FINT ldb, FINT2 sdim, void * alpha, void * beta, void * vsl, FINT ldvsl, void * vsr, FINT ldvsr, float * rconde, float * rcondv, void * work, FINT lwork, float * rwork, FINT2 iwork, FINT liwork, long int * bwork, FINT2 info);
void f77_cggev(const FCHAR jobvl, const FCHAR jobvr, FINT n, void * a, FINT lda, void * b, FINT ldb, void * alpha, void * beta, void * vl, FINT ldvl, void * vr, FINT ldvr, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cggevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, void * a, FINT lda, void * b, FINT ldb, void * alpha, void * beta, void * vl, FINT ldvl, void * vr, FINT ldvr, FINT2 ilo, FINT2 ihi, float * lscale, float * rscale, float * abnrm, float * bbnrm, float * rconde, float * rcondv, void * work, FINT lwork, float * rwork, FINT2 iwork, long int * bwork, FINT2 info);
void f77_cggglm(FINT n, FINT m, FINT p, void * a, FINT lda, void * b, FINT ldb, void * d, void * x, void * y, void * work, FINT lwork, FINT2 info);
void f77_cgghrd(const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, void * a, FINT lda, void * b, FINT ldb, void * q, FINT ldq, void * z, FINT ldz, FINT2 info);
void f77_cgglse(FINT m, FINT n, FINT p, void * a, FINT lda, void * b, FINT ldb, void * c, void * d, void * x, void * work, FINT lwork, FINT2 info);
void f77_cggqrf(FINT n, FINT m, FINT p, void * a, FINT lda, void * taua, void * b, FINT ldb, void * taub, void * work, FINT lwork, FINT2 info);
void f77_cggrqf(FINT m, FINT p, FINT n, void * a, FINT lda, void * taua, void * b, FINT ldb, void * taub, void * work, FINT lwork, FINT2 info);
void f77_cggsvd(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT n, FINT p, FINT2 k, FINT2 l, void * a, FINT lda, void * b, FINT ldb, float * alpha, float * beta, void * u, FINT ldu, void * v, FINT ldv, void * q, FINT ldq, void * work, float * rwork, FINT2 iwork, FINT2 info);
void f77_cggsvp(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, void * a, FINT lda, void * b, FINT ldb, const float * tola, const float * tolb, FINT2 k, FINT2 l, void * u, FINT ldu, void * v, FINT ldv, void * q, FINT ldq, FINT2 iwork, float * rwork, void * tau, void * work, FINT2 info);
void f77_cgtcon(const FCHAR norm, FINT n, const void * dl, const void * d, const void * du, const void * du2, FINT ipiv, const float * anorm, float * rcond, void * work, FINT2 info);
void f77_cgtrfs(const FCHAR trans, FINT n, FINT nrhs, const void * dl, const void * d, const void * du, const void * dlf, const void * df, const void * duf, const void * du2, FINT ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cgtsv(FINT n, FINT nrhs, void * dl, void * d, void * du, void * b, FINT ldb, FINT2 info);
void f77_cgtsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, const void * dl, const void * d, const void * du, void * dlf, void * df, void * duf, void * du2, FINT2 ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cgttrf(FINT n, void * dl, void * d, void * du, void * du2, FINT2 ipiv, FINT2 info);
void f77_cgttrs(const FCHAR trans, FINT n, FINT nrhs, const void * dl, const void * d, const void * du, const void * du2, FINT ipiv, void * b, FINT ldb, FINT2 info);
void f77_cgtts2(FINT itrans, FINT n, FINT nrhs, const void * dl, const void * d, const void * du, const void * du2, FINT ipiv, void * b, FINT ldb);
void f77_chbev(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 info);
void f77_chbevd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, float * w, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_chbevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, void * q, FINT ldq, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_chbgst(const FCHAR vect, const FCHAR uplo, FINT n, FINT ka, FINT kb, void * ab, FINT ldab, const void * bb, FINT ldbb, void * x, FINT ldx, void * work, float * rwork, FINT2 info);
void f77_chbgv(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, void * ab, FINT ldab, void * bb, FINT ldbb, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 info);
void f77_chbgvd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, void * ab, FINT ldab, void * bb, FINT ldbb, float * w, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_chbgvx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT ka, FINT kb, void * ab, FINT ldab, void * bb, FINT ldbb, void * q, FINT ldq, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_chbtrd(const FCHAR vect, const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, float * d, float * e, void * q, FINT ldq, void * work, FINT2 info);
void f77_checon(const FCHAR uplo, FINT n, const void * a, FINT lda, FINT ipiv, const float * anorm, float * rcond, void * work, FINT2 info);
void f77_cheev(const FCHAR jobz, const FCHAR uplo, FINT n, void * a, FINT lda, float * w, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_cheevd(const FCHAR jobz, const FCHAR uplo, FINT n, void * a, FINT lda, float * w, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_cheevr(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void * a, FINT lda, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, FINT2 isuppz, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_cheevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void * a, FINT lda, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_chegs2(FINT itype, const FCHAR uplo, FINT n, void * a, FINT lda, const void * b, FINT ldb, FINT2 info);
void f77_chegst(FINT itype, const FCHAR uplo, FINT n, void * a, FINT lda, const void * b, FINT ldb, FINT2 info);
void f77_chegv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void * a, FINT lda, void * b, FINT ldb, float * w, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_chegvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void * a, FINT lda, void * b, FINT ldb, float * w, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_chegvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void * a, FINT lda, void * b, FINT ldb, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_cherfs(const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, const void * af, FINT ldaf, FINT ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_chesv(const FCHAR uplo, FINT n, FINT nrhs, void * a, FINT lda, FINT2 ipiv, void * b, FINT ldb, void * work, FINT lwork, FINT2 info);
void f77_chesvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, void * af, FINT ldaf, FINT2 ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_chetd2(const FCHAR uplo, FINT n, void * a, FINT lda, float * d, float * e, void * tau, FINT2 info);
void f77_chetf2(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_chetrd(const FCHAR uplo, FINT n, void * a, FINT lda, float * d, float * e, void * tau, void * work, FINT lwork, FINT2 info);
void f77_chetrf(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 ipiv, void * work, FINT lwork, FINT2 info);
void f77_chetri(const FCHAR uplo, FINT n, void * a, FINT lda, FINT ipiv, void * work, FINT2 info);
void f77_chetrs(const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, FINT ipiv, void * b, FINT ldb, FINT2 info);
void f77_chgeqz(const FCHAR job, const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, void * h, FINT ldh, void * t, FINT ldt, void * alpha, void * beta, void * q, FINT ldq, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_chpcon(const FCHAR uplo, FINT n, const void * ap, FINT ipiv, const float * anorm, float * rcond, void * work, FINT2 info);
void f77_chpev(const FCHAR jobz, const FCHAR uplo, FINT n, void * ap, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 info);
void f77_chpevd(const FCHAR jobz, const FCHAR uplo, FINT n, void * ap, float * w, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_chpevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void * ap, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_chpgst(FINT itype, const FCHAR uplo, FINT n, void * ap, const void * bp, FINT2 info);
void f77_chpgv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void * ap, void * bp, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 info);
void f77_chpgvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void * ap, void * bp, float * w, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_chpgvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void * ap, void * bp, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, void * work, float * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_chprfs(const FCHAR uplo, FINT n, FINT nrhs, const void * ap, const void * afp, FINT ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_chpsv(const FCHAR uplo, FINT n, FINT nrhs, void * ap, FINT2 ipiv, void * b, FINT ldb, FINT2 info);
void f77_chpsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void * ap, void * afp, FINT2 ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_chptrd(const FCHAR uplo, FINT n, void * ap, float * d, float * e, void * tau, FINT2 info);
void f77_chptrf(const FCHAR uplo, FINT n, void * ap, FINT2 ipiv, FINT2 info);
void f77_chptri(const FCHAR uplo, FINT n, void * ap, FINT ipiv, void * work, FINT2 info);
void f77_chptrs(const FCHAR uplo, FINT n, FINT nrhs, const void * ap, FINT ipiv, void * b, FINT ldb, FINT2 info);
void f77_chsein(const FCHAR side, const FCHAR eigsrc, const FCHAR initv, FLOG select, FINT n, const void * h, FINT ldh, void * w, void * vl, FINT ldvl, void * vr, FINT ldvr, FINT mm, FINT2 m, void * work, float * rwork, FINT2 ifaill, FINT2 ifailr, FINT2 info);
void f77_chseqr(const FCHAR job, const FCHAR compz, FINT n, FINT ilo, FINT ihi, void * h, FINT ldh, void * w, void * z, FINT ldz, void * work, FINT lwork, FINT2 info);
void f77_clabrd(FINT m, FINT n, FINT nb, void * a, FINT lda, float * d, float * e, void * tauq, void * taup, void * x, FINT ldx, void * y, FINT ldy);
void f77_clacgv(FINT n, void * x, FINT incx);
void f77_clacn2(FINT n, void * v, void * x, float * est, FINT2 kase, FINT2 isave);
void f77_clacon(FINT n, void * v, void * x, float * est, FINT2 kase);
void f77_clacp2(const FCHAR uplo, FINT m, FINT n, const float * a, FINT lda, void * b, FINT ldb);
void f77_clacpy(const FCHAR uplo, FINT m, FINT n, const void * a, FINT lda, void * b, FINT ldb);
void f77_clacrm(FINT m, FINT n, const void * a, FINT lda, const float * b, FINT ldb, const void * c, FINT ldc, float * rwork);
void f77_clacrt(FINT n, void * cx, FINT incx, void * cy, FINT incy, const void * c, const void * s);
void cladivsub(void *output, const void * x, const void * y);
void f77_claed0(FINT qsiz, FINT n, float * d, float * e, void * q, FINT ldq, FINT2 iwork, float * rwork, void * qstore, FINT ldqs, FINT2 info);
void f77_claed7(FINT n, FINT cutpnt, FINT qsiz, FINT tlvls, FINT curlvl, FINT curpbm, float * d, void * q, FINT ldq, const float * rho, FINT2 indxq, FINT2 iwork, float * rwork, void * work, float * qstore, FINT2 qptr, FINT prmptr, FINT perm, FINT givptr, FINT givcol, const float * givnum, FINT2 info);
void f77_claed8(FINT2 k, FINT n, FINT qsiz, void * q, FINT ldq, float * d, float * rho, FINT cutpnt, const float * z, float * dlamda, void * q2, FINT ldq2, float * w, FINT2 indxp, FINT2 indx, FINT indxq, FINT2 perm, FINT2 givptr, FINT2 givcol, float * givnum, FINT2 info);
void f77_claein(FLOG rightv, FLOG noinit, FINT n, const void * h, FINT ldh, const void * w, void * v, void * b, FINT ldb, float * rwork, const float * eps3, const float * smlnum, FINT2 info);
void f77_claesy(const void * a, const void * b, const void * c, void * rt1, void * rt2, void * evscal, void * cs1, void * sn1);
void f77_claev2(const void * a, const void * b, const void * c, float * rt1, float * rt2, float * cs1, void * sn1);
void f77_clags2(FLOG upper, const float * a1, const void * a2, const float * a3, const float * b1, const void * b2, const float * b3, float * csu, void * snu, float * csv, void * snv, float * csq, void * snq);
void f77_clagtm(const FCHAR trans, FINT n, FINT nrhs, const float * alpha, const void * dl, const void * d, const void * du, const void * x, FINT ldx, const float * beta, void * b, FINT ldb);
void f77_clahef(const FCHAR uplo, FINT n, FINT nb, FINT2 kb, void * a, FINT lda, FINT2 ipiv, void * w, FINT ldw, FINT2 info);
void f77_clahqr(FLOG wantt, FLOG wantz, FINT n, FINT ilo, FINT ihi, void * h, FINT ldh, void * w, FINT iloz, FINT ihiz, void * z, FINT ldz, FINT2 info);
void f77_clahrd(FINT n, FINT k, FINT nb, void * a, FINT lda, void * tau, void * t, FINT ldt, void * y, FINT ldy);
void f77_claic1(FINT job, FINT j, const void * x, const float * sest, const void * w, const void * gamma, float * sestpr, void * s, void * c);
void f77_clals0(FINT icompq, FINT nl, FINT nr, FINT sqre, FINT nrhs, void * b, FINT ldb, void * bx, FINT ldbx, FINT perm, FINT givptr, FINT givcol, FINT ldgcol, const float * givnum, FINT ldgnum, const float * poles, const float * difl, const float * difr, const float * z, FINT k, const float * c, const float * s, float * rwork, FINT2 info);
void f77_clalsa(FINT icompq, FINT smlsiz, FINT n, FINT nrhs, void * b, FINT ldb, void * bx, FINT ldbx, const float * u, FINT ldu, const float * vt, FINT k, const float * difl, const float * difr, const float * z, const float * poles, FINT givptr, FINT givcol, FINT ldgcol, FINT perm, const float * givnum, const float * c, const float * s, float * rwork, FINT2 iwork, FINT2 info);
void f77_clalsd(const FCHAR uplo, FINT smlsiz, FINT n, FINT nrhs, float * d, float * e, void * b, FINT ldb, const float * rcond, FINT2 rank, void * work, float * rwork, FINT2 iwork, FINT2 info);
void clangbsub(float output, const FCHAR norm, FINT n, FINT kl, FINT ku, const void * ab, FINT ldab, float * work);
void clangesub(float output, const FCHAR norm, FINT m, FINT n, const void * a, FINT lda, float * work);
void clangtsub(float output, const FCHAR norm, FINT n, const void * dl, const void * d, const void * du);
void clanhbsub(float output, const FCHAR norm, const FCHAR uplo, FINT n, FINT k, const void * ab, FINT ldab, float * work);
void clanhesub(float output, const FCHAR norm, const FCHAR uplo, FINT n, const void * a, FINT lda, float * work);
void clanhpsub(float output, const FCHAR norm, const FCHAR uplo, FINT n, const void * ap, float * work);
void clanhssub(float output, const FCHAR norm, FINT n, const void * a, FINT lda, float * work);
void clanhtsub(float output, const FCHAR norm, FINT n, const float * d, const void * e);
void clansbsub(float output, const FCHAR norm, const FCHAR uplo, FINT n, FINT k, const void * ab, FINT ldab, float * work);
void clanspsub(float output, const FCHAR norm, const FCHAR uplo, FINT n, const void * ap, float * work);
void clansysub(float output, const FCHAR norm, const FCHAR uplo, FINT n, const void * a, FINT lda, float * work);
void clantbsub(float output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT k, const void * ab, FINT ldab, float * work);
void clantpsub(float output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const void * ap, float * work);
void clantrsub(float output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT m, FINT n, const void * a, FINT lda, float * work);
void f77_clapll(FINT n, void * x, FINT incx, void * y, FINT incy, float * ssmin);
void f77_clapmt(FLOG forwrd, FINT m, FINT n, void * x, FINT ldx, FINT2 k);
void f77_claqgb(FINT m, FINT n, FINT kl, FINT ku, void * ab, FINT ldab, const float * r, const float * c, const float * rowcnd, const float * colcnd, const float * amax, FCHAR equed);
void f77_claqge(FINT m, FINT n, void * a, FINT lda, const float * r, const float * c, const float * rowcnd, const float * colcnd, const float * amax, FCHAR equed);
void f77_claqhb(const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, float * s, const float * scond, const float * amax, FCHAR equed);
void f77_claqhe(const FCHAR uplo, FINT n, void * a, FINT lda, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_claqhp(const FCHAR uplo, FINT n, void * ap, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_claqp2(FINT m, FINT n, FINT offset, void * a, FINT lda, FINT2 jpvt, void * tau, float * vn1, float * vn2, void * work);
void f77_claqps(FINT m, FINT n, FINT offset, FINT nb, FINT2 kb, void * a, FINT lda, FINT2 jpvt, void * tau, float * vn1, float * vn2, void * auxv, void * f, FINT ldf);
void f77_claqsb(const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_claqsp(const FCHAR uplo, FINT n, void * ap, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_claqsy(const FCHAR uplo, FINT n, void * a, FINT lda, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_clar1v(FINT n, FINT b1, FINT bn, const float * sigma, const float * l, const float * d, const float * ld, const float * lld, const float * gersch, void * z, float * ztz, float * mingma, FINT2 r, FINT2 isuppz, float * work);
void f77_clar2v(FINT n, void * x, void * y, void * z, FINT incx, const float * c, const void * s, FINT incc);
void f77_clarcm(FINT m, FINT n, const float * a, FINT lda, const float * b, FINT ldb, const void * c, FINT ldc, float * rwork);
void f77_clarf(const FCHAR side, FINT m, FINT n, const void * v, FINT incv, const void * tau, void * c, FINT ldc, void * work);
void f77_clarfb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, const void * v, FINT ldv, const void * t, FINT ldt, void * c, FINT ldc, void * work, FINT ldwork);
void f77_clarfg(FINT n, void * alpha, void * x, FINT incx, void * tau);
void f77_clarft(const FCHAR direct, const FCHAR storev, FINT n, FINT k, void * v, FINT ldv, const void * tau, void * t, FINT ldt);
void f77_clarfx(const FCHAR side, FINT m, FINT n, const void * v, const void * tau, void * c, FINT ldc, void * work);
void f77_clargv(FINT n, void * x, FINT incx, void * y, FINT incy, float * c, FINT incc);
void f77_clarnv(FINT idist, FINT2 iseed, FINT n, void * x);
void f77_clarrv(FINT n, float * d, float * l, FINT isplit, FINT m, const float * w, FINT iblock, const float * gersch, const float * tol, void * z, FINT ldz, FINT2 isuppz, float * work, FINT2 iwork, FINT2 info);
void f77_clartg(const void * f, const void * g, float * cs, void * sn, void * r);
void f77_clartv(FINT n, void * x, FINT incx, void * y, FINT incy, const float * c, const void * s, FINT incc);
void f77_clarz(const FCHAR side, FINT m, FINT n, FINT l, const void * v, FINT incv, const void * tau, void * c, FINT ldc, void * work);
void f77_clarzb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, FINT l, const void * v, FINT ldv, const void * t, FINT ldt, void * c, FINT ldc, void * work, FINT ldwork);
void f77_clarzt(const FCHAR direct, const FCHAR storev, FINT n, FINT k, void * v, FINT ldv, const void * tau, void * t, FINT ldt);
void f77_clascl(const FCHAR type, FINT kl, FINT ku, const float * cfrom, const float * cto, FINT m, FINT n, void * a, FINT lda, FINT2 info);
void f77_claset(const FCHAR uplo, FINT m, FINT n, const void * alpha, const void * beta, void * a, FINT lda);
void f77_clasr(const FCHAR side, const FCHAR pivot, const FCHAR direct, FINT m, FINT n, const float * c, const float * s, void * a, FINT lda);
void f77_classq(FINT n, const void * x, FINT incx, float * scale, float * sumsq);
void f77_claswp(FINT n, void * a, FINT lda, FINT k1, FINT k2, FINT ipiv, FINT incx);
void f77_clasyf(const FCHAR uplo, FINT n, FINT nb, FINT2 kb, void * a, FINT lda, FINT2 ipiv, void * w, FINT ldw, FINT2 info);
void f77_clatbs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, FINT kd, const void * ab, FINT ldab, void * x, float * scale, float * cnorm, FINT2 info);
void f77_clatdf(FINT ijob, FINT n, const float * z, FINT ldz, float * rhs, float * rdsum, float * rdscal, FINT ipiv, FINT jpiv);
void f77_clatps(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const void * ap, void * x, float * scale, float * cnorm, FINT2 info);
void f77_clatrd(const FCHAR uplo, FINT n, FINT nb, void * a, FINT lda, float * e, void * tau, void * w, FINT ldw);
void f77_clatrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const void * a, FINT lda, void * x, float * scale, float * cnorm, FINT2 info);
void f77_clatrz(FINT m, FINT n, FINT l, void * a, FINT lda, void * tau, void * work);
void f77_clatzm(const FCHAR side, FINT m, FINT n, const void * v, FINT incv, const void * tau, void * c1, void * c2, FINT ldc, void * work);
void f77_clauu2(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 info);
void f77_clauum(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 info);
void f77_cpbcon(const FCHAR uplo, FINT n, FINT kd, const void * ab, FINT ldab, const float * anorm, float * rcond, void * work, float * rwork, FINT2 info);
void f77_cpbequ(const FCHAR uplo, FINT n, FINT kd, const void * ab, FINT ldab, float * s, float * scond, float * amax, FINT2 info);
void f77_cpbrfs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const void * ab, FINT ldab, const void * afb, FINT ldafb, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cpbstf(const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, FINT2 info);
void f77_cpbsv(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, void * ab, FINT ldab, void * b, FINT ldb, FINT2 info);
void f77_cpbsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT kd, FINT nrhs, void * ab, FINT ldab, void * afb, FINT ldafb, FCHAR equed, float * s, void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cpbtf2(const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, FINT2 info);
void f77_cpbtrf(const FCHAR uplo, FINT n, FINT kd, void * ab, FINT ldab, FINT2 info);
void f77_cpbtrs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const void * ab, FINT ldab, void * b, FINT ldb, FINT2 info);
void f77_cpocon(const FCHAR uplo, FINT n, const void * a, FINT lda, const float * anorm, float * rcond, void * work, float * rwork, FINT2 info);
void f77_cpoequ(FINT n, const void * a, FINT lda, float * s, float * scond, float * amax, FINT2 info);
void f77_cporfs(const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, const void * af, FINT ldaf, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cposv(const FCHAR uplo, FINT n, FINT nrhs, void * a, FINT lda, void * b, FINT ldb, FINT2 info);
void f77_cposvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, void * a, FINT lda, void * af, FINT ldaf, FCHAR equed, float * s, void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cpotf2(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 info);
void f77_cpotrf(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 info);
void f77_cpotri(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 info);
void f77_cpotrs(const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, void * b, FINT ldb, FINT2 info);
void f77_cppcon(const FCHAR uplo, FINT n, const void * ap, const float * anorm, float * rcond, void * work, float * rwork, FINT2 info);
void f77_cppequ(const FCHAR uplo, FINT n, const void * ap, float * s, float * scond, float * amax, FINT2 info);
void f77_cpprfs(const FCHAR uplo, FINT n, FINT nrhs, const void * ap, const void * afp, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cppsv(const FCHAR uplo, FINT n, FINT nrhs, void * ap, void * b, FINT ldb, FINT2 info);
void f77_cppsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, void * ap, void * afp, FCHAR equed, float * s, void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cpptrf(const FCHAR uplo, FINT n, void * ap, FINT2 info);
void f77_cpptri(const FCHAR uplo, FINT n, void * ap, FINT2 info);
void f77_cpptrs(const FCHAR uplo, FINT n, FINT nrhs, const void * ap, void * b, FINT ldb, FINT2 info);
void f77_cptcon(FINT n, const float * d, const void * e, const float * anorm, float * rcond, float * rwork, FINT2 info);
void f77_cpteqr(const FCHAR compz, FINT n, float * d, float * e, void * z, FINT ldz, float * work, FINT2 info);
void f77_cptrfs(const FCHAR uplo, FINT n, FINT nrhs, const float * d, const void * e, const float * df, const void * ef, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cptsv(FINT n, FINT nrhs, float * d, void * e, void * b, FINT ldb, FINT2 info);
void f77_cptsvx(const FCHAR fact, FINT n, FINT nrhs, const float * d, const void * e, float * df, void * ef, const void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cpttrf(FINT n, float * d, void * e, FINT2 info);
void f77_cpttrs(const FCHAR uplo, FINT n, FINT nrhs, const float * d, const void * e, float * b, FINT ldb, FINT2 info);
void f77_cptts2(FINT iuplo, FINT n, FINT nrhs, const float * d, const void * e, float * b, FINT ldb);
void f77_crot(FINT n, void * cx, FINT incx, void * cy, FINT incy, const float * c, const void * s);
void f77_cspcon(const FCHAR uplo, FINT n, const void * ap, FINT ipiv, const float * anorm, float * rcond, void * work, FINT2 info);
void f77_cspmv(const FCHAR uplo, FINT n, const void * alpha, const void * ap, const void * x, FINT incx, const void * beta, void * y, FINT incy);
void f77_cspr(const FCHAR uplo, FINT n, const void * alpha, const void * x, FINT incx, void * ap);
void f77_csprfs(const FCHAR uplo, FINT n, FINT nrhs, const void * ap, const void * afp, FINT ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_cspsv(const FCHAR uplo, FINT n, FINT nrhs, void * ap, FINT2 ipiv, void * b, FINT ldb, FINT2 info);
void f77_cspsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void * ap, void * afp, FINT2 ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_csptrf(const FCHAR uplo, FINT n, void * ap, FINT2 ipiv, FINT2 info);
void f77_csptri(const FCHAR uplo, FINT n, void * ap, FINT ipiv, void * work, FINT2 info);
void f77_csptrs(const FCHAR uplo, FINT n, FINT nrhs, const void * ap, FINT ipiv, void * b, FINT ldb, FINT2 info);
void f77_csrot(FINT n, const void * cx, FINT incx, const void * cy, FINT incy, const float * c, const float * s);
void f77_csrscl(FINT n, const float * sa, void * sx, FINT incx);
void f77_cstedc(const FCHAR compz, FINT n, float * d, float * e, void * z, FINT ldz, void * work, FINT lwork, float * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_cstegr(const FCHAR jobz, const FCHAR range, FINT n, float * d, float * e, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, void * z, FINT ldz, FINT2 isuppz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_cstein(FINT n, const float * d, const float * e, FINT m, const float * w, FINT iblock, FINT isplit, void * z, FINT ldz, float * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_csteqr(const FCHAR compz, FINT n, float * d, float * e, void * z, FINT ldz, float * work, FINT2 info);
void f77_csycon(const FCHAR uplo, FINT n, const void * a, FINT lda, FINT ipiv, const float * anorm, float * rcond, void * work, FINT2 info);
void f77_csymv(const FCHAR uplo, FINT n, const void * alpha, const void * a, FINT lda, const void * x, FINT incx, const void * beta, void * y, FINT incy);
void f77_csyr(const FCHAR uplo, FINT n, const void * alpha, const void * x, FINT incx, void * a, FINT lda);
void f77_csyrfs(const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, const void * af, FINT ldaf, FINT ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_csysv(const FCHAR uplo, FINT n, FINT nrhs, void * a, FINT lda, FINT2 ipiv, void * b, FINT ldb, void * work, FINT lwork, FINT2 info);
void f77_csysvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, void * af, FINT ldaf, FINT2 ipiv, const void * b, FINT ldb, void * x, FINT ldx, float * rcond, float * ferr, float * berr, void * work, FINT lwork, float * rwork, FINT2 info);
void f77_csytf2(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_csytrf(const FCHAR uplo, FINT n, void * a, FINT lda, FINT2 ipiv, void * work, FINT lwork, FINT2 info);
void f77_csytri(const FCHAR uplo, FINT n, void * a, FINT lda, FINT ipiv, void * work, FINT2 info);
void f77_csytrs(const FCHAR uplo, FINT n, FINT nrhs, const void * a, FINT lda, FINT ipiv, void * b, FINT ldb, FINT2 info);
void f77_ctbcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT kd, const void * ab, FINT ldab, float * rcond, void * work, float * rwork, FINT2 info);
void f77_ctbrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const void * ab, FINT ldab, const void * b, FINT ldb, const void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_ctbtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const void * ab, FINT ldab, void * b, FINT ldb, FINT2 info);
void f77_ctgevc(const FCHAR side, const FCHAR howmny, FLOG select, FINT n, const void * s, FINT lds, const void * p, FINT ldp, void * vl, FINT ldvl, void * vr, FINT ldvr, FINT mm, FINT2 m, void * work, float * rwork, FINT2 info);
void f77_ctgex2(FLOG wantq, FLOG wantz, FINT n, void * a, FINT lda, void * b, FINT ldb, void * q, FINT ldq, void * z, FINT ldz, FINT j1, FINT2 info);
void f77_ctgexc(FLOG wantq, FLOG wantz, FINT n, void * a, FINT lda, void * b, FINT ldb, void * q, FINT ldq, void * z, FINT ldz, FINT ifst, FINT2 ilst, FINT2 info);
void f77_ctgsen(FINT ijob, FLOG wantq, FLOG wantz, FLOG select, FINT n, void * a, FINT lda, void * b, FINT ldb, void * alpha, void * beta, void * q, FINT ldq, void * z, FINT ldz, FINT2 m, float * pl, float * pr, float * dif, void * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_ctgsja(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, FINT k, FINT l, void * a, FINT lda, void * b, FINT ldb, const float * tola, const float * tolb, float * alpha, float * beta, void * u, FINT ldu, void * v, FINT ldv, void * q, FINT ldq, void * work, FINT2 ncycle, FINT2 info);
void f77_ctgsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const void * a, FINT lda, const void * b, FINT ldb, const void * vl, FINT ldvl, const void * vr, FINT ldvr, float * s, float * dif, FINT mm, FINT2 m, void * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_ctgsy2(const FCHAR trans, FINT ijob, FINT m, FINT n, const void * a, FINT lda, const void * b, FINT ldb, void * c, FINT ldc, const void * d, FINT ldd, const void * e, FINT lde, void * f, FINT ldf, float * scale, float * rdsum, float * rdscal, FINT2 info);
void f77_ctgsyl(const FCHAR trans, FINT ijob, FINT m, FINT n, const void * a, FINT lda, const void * b, FINT ldb, void * c, FINT ldc, const void * d, FINT ldd, const void * e, FINT lde, void * f, FINT ldf, float * dif, float * scale, void * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_ctpcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const void * ap, float * rcond, void * work, float * rwork, FINT2 info);
void f77_ctprfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void * ap, const void * b, FINT ldb, const void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_ctptri(const FCHAR uplo, const FCHAR diag, FINT n, void * ap, FINT2 info);
void f77_ctptrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void * ap, void * b, FINT ldb, FINT2 info);
void f77_ctrcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const void * a, FINT lda, float * rcond, void * work, float * rwork, FINT2 info);
void f77_ctrevc(const FCHAR side, const FCHAR howmny, FLOG select, FINT n, void * t, FINT ldt, void * vl, FINT ldvl, void * vr, FINT ldvr, FINT mm, FINT2 m, void * work, float * rwork, FINT2 info);
void f77_ctrexc(const FCHAR compq, FINT n, void * t, FINT ldt, void * q, FINT ldq, FINT ifst, FINT ilst, FINT2 info);
void f77_ctrrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void * a, FINT lda, const void * b, FINT ldb, const void * x, FINT ldx, float * ferr, float * berr, void * work, float * rwork, FINT2 info);
void f77_ctrsen(const FCHAR job, const FCHAR compq, FLOG select, FINT n, void * t, FINT ldt, void * q, FINT ldq, void * w, FINT2 m, float * s, float * sep, void * work, FINT lwork, FINT2 info);
void f77_ctrsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const void * t, FINT ldt, const void * vl, FINT ldvl, const void * vr, FINT ldvr, float * s, float * sep, FINT mm, FINT2 m, void * work, FINT ldwork, float * rwork, FINT2 info);
void f77_ctrsyl(const FCHAR trana, const FCHAR tranb, FINT isgn, FINT m, FINT n, const void * a, FINT lda, const void * b, FINT ldb, void * c, FINT ldc, float * scale, FINT2 info);
void f77_ctrti2(const FCHAR uplo, const FCHAR diag, FINT n, void * a, FINT lda, FINT2 info);
void f77_ctrtri(const FCHAR uplo, const FCHAR diag, FINT n, void * a, FINT lda, FINT2 info);
void f77_ctrtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void * a, FINT lda, void * b, FINT ldb, FINT2 info);
void f77_ctzrqf(FINT m, FINT n, void * a, FINT lda, void * tau, FINT2 info);
void f77_ctzrzf(FINT m, FINT n, void * a, FINT lda, void * tau, void * work, FINT lwork, FINT2 info);
void f77_cung2l(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT2 info);
void f77_cung2r(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT2 info);
void f77_cungbr(const FCHAR vect, FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT lwork, FINT2 info);
void f77_cunghr(FINT n, FINT ilo, FINT ihi, void * a, FINT lda, const void * tau, void * work, FINT lwork, FINT2 info);
void f77_cungl2(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT2 info);
void f77_cunglq(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT lwork, FINT2 info);
void f77_cungql(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT lwork, FINT2 info);
void f77_cungqr(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT lwork, FINT2 info);
void f77_cungr2(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT2 info);
void f77_cungrq(FINT m, FINT n, FINT k, void * a, FINT lda, const void * tau, void * work, FINT lwork, FINT2 info);
void f77_cungtr(const FCHAR uplo, FINT n, void * a, FINT lda, const void * tau, void * work, FINT lwork, FINT2 info);
void f77_cunm2l(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT2 info);
void f77_cunm2r(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT2 info);
void f77_cunmbr(const FCHAR vect, const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cunmhr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT ilo, FINT ihi, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cunml2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT2 info);
void f77_cunmlq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cunmql(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cunmqr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cunmr2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT2 info);
void f77_cunmr3(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT2 info);
void f77_cunmrq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cunmrz(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cunmtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const void * a, FINT lda, const void * tau, void * c, FINT ldc, void * work, FINT lwork, FINT2 info);
void f77_cupgtr(const FCHAR uplo, FINT n, const void * ap, const void * tau, void * q, FINT ldq, void * work, FINT2 info);
void f77_cupmtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const void * ap, const void * tau, void * c, FINT ldc, void * work, FINT2 info);
void f77_dbdsdc(const FCHAR uplo, const FCHAR compq, FINT n, double * d, double * e, double * u, FINT ldu, double * vt, FINT ldvt, double * q, FINT2 iq, double * work, FINT2 iwork, FINT2 info);
void f77_dbdsqr(const FCHAR uplo, FINT n, FINT ncvt, FINT nru, FINT ncc, double * d, double * e, double * vt, FINT ldvt, double * u, FINT ldu, double * c, FINT ldc, double * work, FINT2 info);
void f77_ddisna(const FCHAR job, FINT m, FINT n, const double * d, double * sep, FINT2 info);
void f77_dgbbrd(const FCHAR vect, FINT m, FINT n, FINT ncc, FINT kl, FINT ku, double * ab, FINT ldab, double * d, double * e, double * q, FINT ldq, double * pt, FINT ldpt, double * c, FINT ldc, double * work, FINT2 info);
void f77_dgbcon(const FCHAR norm, FINT n, FINT kl, FINT ku, const double * ab, FINT ldab, FINT ipiv, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dgbequ(FINT m, FINT n, FINT kl, FINT ku, const double * ab, FINT ldab, double * r, double * c, double * rowcnd, double * colcnd, double * amax, FINT2 info);
void f77_dgbrfs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const double * ab, FINT ldab, const double * afb, FINT ldafb, FINT ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dgbsv(FINT n, FINT kl, FINT ku, FINT nrhs, double * ab, FINT ldab, FINT2 ipiv, double * b, FINT ldb, FINT2 info);
void f77_dgbsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, double * ab, FINT ldab, double * afb, FINT ldafb, FINT2 ipiv, FCHAR equed, double * r, double * c, double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dgbtf2(FINT m, FINT n, FINT kl, FINT ku, double * ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_dgbtrf(FINT m, FINT n, FINT kl, FINT ku, double * ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_dgbtrs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const double * ab, FINT ldab, FINT ipiv, double * b, FINT ldb, FINT2 info);
void f77_dgebak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const double * scale, FINT m, double * v, FINT ldv, FINT2 info);
void f77_dgebal(const FCHAR job, FINT n, double * a, FINT lda, FINT2 ilo, FINT2 ihi, double * scale, FINT2 info);
void f77_dgebd2(FINT m, FINT n, double * a, FINT lda, double * d, double * e, double * tauq, double * taup, double * work, FINT2 info);
void f77_dgebrd(FINT m, FINT n, double * a, FINT lda, double * d, double * e, double * tauq, double * taup, double * work, FINT lwork, FINT2 info);
void f77_dgecon(const FCHAR norm, FINT n, const double * a, FINT lda, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dgeequ(FINT m, FINT n, const double * a, FINT lda, double * r, double * c, double * rowcnd, double * colcnd, double * amax, FINT2 info);
void f77_dgees(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (double*,double*), FINT n, double * a, FINT lda, FINT2 sdim, double * wr, double * wi, double * vs, FINT ldvs, double * work, FINT lwork, long int * bwork, FINT2 info);
void f77_dgeesx(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (double*,double*), const FCHAR sense, FINT n, double * a, FINT lda, FINT2 sdim, double * wr, double * wi, double * vs, FINT ldvs, double * rconde, double * rcondv, double * work, FINT lwork, FINT2 iwork, FINT liwork, long int * bwork, FINT2 info);
void f77_dgeev(const FCHAR jobvl, const FCHAR jobvr, FINT n, double * a, FINT lda, double * wr, double * wi, double * vl, FINT ldvl, double * vr, FINT ldvr, double * work, FINT lwork, FINT2 info);
void f77_dgeevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, double * a, FINT lda, double * wr, double * wi, double * vl, FINT ldvl, double * vr, FINT ldvr, FINT2 ilo, FINT2 ihi, double * scale, double * abnrm, double * rconde, double * rcondv, double * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_dgegs(const FCHAR jobvsl, const FCHAR jobvsr, FINT n, double * a, FINT lda, double * b, FINT ldb, double * alphar, double * alphai, double * beta, double * vsl, FINT ldvsl, double * vsr, FINT ldvsr, double * work, FINT lwork, FINT2 info);
void f77_dgegv(const FCHAR jobvl, const FCHAR jobvr, FINT n, double * a, FINT lda, double * b, FINT ldb, double * alphar, double * alphai, double * beta, double * vl, FINT ldvl, double * vr, FINT ldvr, double * work, FINT lwork, FINT2 info);
void f77_dgehd2(FINT n, FINT ilo, FINT ihi, double * a, FINT lda, double * tau, double * work, FINT2 info);
void f77_dgehrd(FINT n, FINT ilo, FINT ihi, double * a, FINT lda, double * tau, double * work, FINT lwork, FINT2 info);
void f77_dgelq2(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT2 info);
void f77_dgelqf(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT lwork, FINT2 info);
void f77_dgels(const FCHAR trans, FINT m, FINT n, FINT nrhs, double * a, FINT lda, double * b, FINT ldb, double * work, FINT lwork, FINT2 info);
void f77_dgelsd(FINT m, FINT n, FINT nrhs, const double * a, FINT lda, double * b, FINT ldb, double * s, const double * rcond, FINT2 rank, double * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_dgelss(FINT m, FINT n, FINT nrhs, double * a, FINT lda, double * b, FINT ldb, double * s, const double * rcond, FINT2 rank, double * work, FINT lwork, FINT2 info);
void f77_dgelsx(FINT m, FINT n, FINT nrhs, double * a, FINT lda, double * b, FINT ldb, FINT2 jpvt, const double * rcond, FINT2 rank, double * work, FINT2 info);
void f77_dgelsy(FINT m, FINT n, FINT nrhs, double * a, FINT lda, double * b, FINT ldb, FINT2 jpvt, const double * rcond, FINT2 rank, double * work, FINT lwork, FINT2 info);
void f77_dgeql2(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT2 info);
void f77_dgeqlf(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT lwork, FINT2 info);
void f77_dgeqp3(FINT m, FINT n, double * a, FINT lda, FINT2 jpvt, double * tau, double * work, FINT lwork, FINT2 info);
void f77_dgeqpf(FINT m, FINT n, double * a, FINT lda, FINT2 jpvt, double * tau, double * work, FINT2 info);
void f77_dgeqr2(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT2 info);
void f77_dgeqrf(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT lwork, FINT2 info);
void f77_dgerfs(const FCHAR trans, FINT n, FINT nrhs, const double * a, FINT lda, const double * af, FINT ldaf, FINT ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dgerq2(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT2 info);
void f77_dgerqf(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT lwork, FINT2 info);
void f77_dgesc2(FINT n, const double * a, FINT lda, double * rhs, FINT ipiv, FINT jpiv, double * scale);
void f77_dgesdd(const FCHAR jobz, FINT m, FINT n, double * a, FINT lda, double * s, double * u, FINT ldu, double * vt, FINT ldvt, double * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_dgesv(FINT n, FINT nrhs, double * a, FINT lda, FINT2 ipiv, double * b, FINT ldb, FINT2 info);
void f77_dgesvd(const FCHAR jobu, const FCHAR jobvt, FINT m, FINT n, double * a, FINT lda, double * s, double * u, FINT ldu, double * vt, FINT ldvt, double * work, FINT lwork, FINT2 info);
void f77_dgesvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, double * a, FINT lda, double * af, FINT ldaf, FINT2 ipiv, FCHAR equed, double * r, double * c, double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dgetc2(FINT n, double * a, FINT lda, FINT2 ipiv, FINT2 jpiv, FINT2 info);
void f77_dgetf2(FINT m, FINT n, double * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_dgetrf(FINT m, FINT n, double * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_dgetri(FINT n, double * a, FINT lda, FINT ipiv, double * work, FINT lwork, FINT2 info);
void f77_dgetrs(const FCHAR trans, FINT n, FINT nrhs, const double * a, FINT lda, FINT ipiv, double * b, FINT ldb, FINT2 info);
void f77_dggbak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const double * lscale, const double * rscale, FINT m, double * v, FINT ldv, FINT2 info);
void f77_dggbal(const FCHAR job, FINT n, double * a, FINT lda, double * b, FINT ldb, FINT2 ilo, FINT2 ihi, double * lscale, double * rscale, float * work, FINT2 info);
void f77_dgges(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (double*,double*,double*), FINT n, double * a, FINT lda, double * b, FINT ldb, FINT2 sdim, double * alphar, double * alphai, double * beta, double * vsl, FINT ldvsl, double * vsr, FINT ldvsr, double * work, FINT lwork, long int * bwork, FINT2 info);
void f77_dggesx(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (double*,double*,double*), const FCHAR sense, FINT n, double * a, FINT lda, double * b, FINT ldb, FINT2 sdim, double * alphar, double * alphai, double * beta, double * vsl, FINT ldvsl, double * vsr, FINT ldvsr, double * rconde, double * rcondv, double * work, FINT lwork, FINT2 iwork, FINT liwork, long int * bwork, FINT2 info);
void f77_dggev(const FCHAR jobvl, const FCHAR jobvr, FINT n, double * a, FINT lda, double * b, FINT ldb, double * alphar, double * alphai, double * beta, double * vl, FINT ldvl, double * vr, FINT ldvr, double * work, FINT lwork, FINT2 info);
void f77_dggevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, double * a, FINT lda, double * b, FINT ldb, double * alphar, double * alphai, double * beta, double * vl, FINT ldvl, double * vr, FINT ldvr, FINT2 ilo, FINT2 ihi, double * lscale, double * rscale, double * abnrm, double * bbnrm, double * rconde, double * rcondv, double * work, FINT lwork, FINT2 iwork, long int * bwork, FINT2 info);
void f77_dggglm(FINT n, FINT m, FINT p, double * a, FINT lda, double * b, FINT ldb, double * d, double * x, double * y, double * work, FINT lwork, FINT2 info);
void f77_dgghrd(const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, double * a, FINT lda, double * b, FINT ldb, double * q, FINT ldq, double * z, FINT ldz, FINT2 info);
void f77_dgglse(FINT m, FINT n, FINT p, double * a, FINT lda, double * b, FINT ldb, double * c, double * d, double * x, double * work, FINT lwork, FINT2 info);
void f77_dggqrf(FINT n, FINT m, FINT p, double * a, FINT lda, double * taua, double * b, FINT ldb, double * taub, double * work, FINT lwork, FINT2 info);
void f77_dggrqf(FINT m, FINT p, FINT n, double * a, FINT lda, double * taua, double * b, FINT ldb, double * taub, double * work, FINT lwork, FINT2 info);
void f77_dggsvd(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT n, FINT p, FINT2 k, FINT2 l, double * a, FINT lda, double * b, FINT ldb, double * alpha, double * beta, double * u, FINT ldu, double * v, FINT ldv, double * q, FINT ldq, double * work, FINT2 iwork, FINT2 info);
void f77_dggsvp(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, double * a, FINT lda, double * b, FINT ldb, const double * tola, const double * tolb, FINT2 k, FINT2 l, double * u, FINT ldu, double * v, FINT ldv, double * q, FINT ldq, FINT2 iwork, double * tau, double * work, FINT2 info);
void f77_dgtcon(const FCHAR norm, FINT n, const double * dl, const double * d, const double * du, const double * du2, FINT ipiv, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dgtrfs(const FCHAR trans, FINT n, FINT nrhs, const double * dl, const double * d, const double * du, const double * dlf, const double * df, const double * duf, const double * du2, FINT ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dgtsv(FINT n, FINT nrhs, double * dl, double * d, double * du, double * b, FINT ldb, FINT2 info);
void f77_dgtsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, const double * dl, const double * d, const double * du, double * dlf, double * df, double * duf, double * du2, FINT2 ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dgttrf(FINT n, double * dl, double * d, double * du, double * du2, FINT2 ipiv, FINT2 info);
void f77_dgttrs(const FCHAR trans, FINT n, FINT nrhs, const double * dl, const double * d, const double * du, const double * du2, FINT ipiv, double * b, FINT ldb, FINT2 info);
void f77_dgtts2(FINT itrans, FINT n, FINT nrhs, const double * dl, const double * d, const double * du, const double * du2, FINT ipiv, double * b, FINT ldb);
void f77_dhgeqz(const FCHAR job, const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, double * h, FINT ldh, double * t, FINT ldt, double * alphar, double * alphai, double * beta, double * q, FINT ldq, double * z, FINT ldz, double * work, FINT lwork, FINT2 info);
void f77_dhsein(const FCHAR side, const FCHAR eigsrc, const FCHAR initv, FLOG2 select, FINT n, const double * h, FINT ldh, double * wr, const double * wi, double * vl, FINT ldvl, double * vr, FINT ldvr, FINT mm, FINT2 m, double * work, FINT2 ifaill, FINT2 ifailr, FINT2 info);
void f77_dhseqr(const FCHAR job, const FCHAR compz, FINT n, FINT ilo, FINT ihi, double * h, FINT ldh, double * wr, double * wi, double * z, FINT ldz, double * work, FINT lwork, FINT2 info);
void f77_dlabad(double * small, double * large);
void f77_dlabrd(FINT m, FINT n, FINT nb, double * a, FINT lda, double * d, double * e, double * tauq, double * taup, double * x, FINT ldx, double * y, FINT ldy);
void f77_dlacn2(FINT n, double * v, double * x, FINT2 isgn, double * est, FINT2 kase, FINT2 isave);
void f77_dlacon(FINT n, double * v, double * x, FINT2 isgn, double * est, FINT2 kase);
void f77_dlacpy(const FCHAR uplo, FINT m, FINT n, const double * a, FINT lda, double * b, FINT ldb);
void f77_dladiv(const double * a, const double * b, const double * c, const double * d, double * p, double * q);
void f77_dlae2(const double * a, const double * b, const double * c, double * rt1, double * rt2);
void f77_dlaebz(FINT ijob, FINT nitmax, FINT n, FINT mmax, FINT minp, FINT nbmin, const double * abstol, const double * reltol, const double * pivmin, const double * d, const double * e, const double * e2, FINT2 nval, double * ab, double * c, FINT2 mout, FINT2 nab, double * work, FINT2 iwork, FINT2 info);
void f77_dlaed0(FINT icompq, FINT qsiz, FINT n, double * d, const double * e, double * q, FINT ldq, double * qstore, FINT ldqs, double * work, FINT2 iwork, FINT2 info);
void f77_dlaed1(FINT n, double * d, double * q, FINT ldq, FINT2 indxq, const double * rho, FINT cutpnt, double * work, FINT2 iwork, FINT2 info);
void f77_dlaed2(FINT2 k, FINT n, FINT n1, double * d, double * q, FINT ldq, FINT2 indxq, double * rho, const double * z, double * dlamda, double * w, double * q2, FINT2 indx, FINT2 indxc, FINT2 indxp, FINT2 coltyp, FINT2 info);
void f77_dlaed3(FINT k, FINT n, FINT n1, double * d, double * q, FINT ldq, const double * rho, double * dlamda, const double * q2, FINT indx, FINT ctot, double * w, double * s, FINT lds, FINT2 info);
void f77_dlaed4(FINT n, FINT i, const double * d, const double * z, double * delta, const double * rho, double * dlam, FINT2 info);
void f77_dlaed5(FINT i, const double * d, const double * z, double * delta, const double * rho, double * dlam);
void f77_dlaed6(FINT kniter, FLOG orgati, const double * rho, const double * d, const double * z, const double * finit, double * tau, FINT2 info);
void f77_dlaed7(FINT icompq, FINT n, FINT qsiz, FINT tlvls, FINT curlvl, FINT curpbm, double * d, double * q, FINT ldq, FINT2 indxq, const double * rho, FINT cutpnt, double * qstore, FINT2 qptr, FINT prmptr, FINT perm, FINT givptr, FINT givcol, const double * givnum, double * work, FINT2 iwork, FINT2 info);
void f77_dlaed8(FINT icompq, FINT2 k, FINT n, FINT qsiz, double * d, double * q, FINT ldq, FINT indxq, double * rho, FINT cutpnt, const double * z, double * dlamda, double * q2, FINT ldq2, double * w, FINT2 perm, FINT2 givptr, FINT2 givcol, double * givnum, FINT2 indxp, FINT2 indx, FINT2 info);
void f77_dlaed9(FINT k, FINT kstart, FINT kstop, FINT n, double * d, double * q, FINT ldq, const double * rho, const double * dlamda, const double * w, double * s, FINT lds, FINT2 info);
void f77_dlaeda(FINT n, FINT tlvls, FINT curlvl, FINT curpbm, FINT prmptr, FINT perm, FINT givptr, FINT givcol, const double * givnum, const double * q, FINT qptr, double * z, double * ztemp, FINT2 info);
void f77_dlaein(FLOG rightv, FLOG noinit, FINT n, const double * h, FINT ldh, const double * wr, const double * wi, double * vr, double * vi, double * b, FINT ldb, double * work, const double * eps3, const double * smlnum, const double * bignum, FINT2 info);
void f77_dlaev2(const double * a, const double * b, const double * c, double * rt1, double * rt2, double * cs1, double * sn1);
void f77_dlaexc(FLOG wantq, FINT n, double * t, FINT ldt, double * q, FINT ldq, FINT j1, FINT n1, FINT n2, double * work, FINT2 info);
void f77_dlag2(const double * a, FINT lda, const double * b, FINT ldb, const double * safmin, double * scale1, double * scale2, double * wr1, double * wr2, double * wi);
void f77_dlags2(FLOG upper, const double * a1, const double * a2, const double * a3, const double * b1, const double * b2, const double * b3, double * csu, double * snu, double * csv, double * snv, double * csq, double * snq);
void f77_dlagtf(FINT n, double * a, const double * lambda, double * b, double * c, const double * tol, double * d, FINT in, FINT2 info);
void f77_dlagtm(const FCHAR trans, FINT n, FINT nrhs, const double * alpha, const double * dl, const double * d, const double * du, const double * x, FINT ldx, const double * beta, double * b, FINT ldb);
void f77_dlagts(FINT job, FINT n, const double * a, const double * b, const double * c, const double * d, FINT in, double * y, double * tol, FINT2 info);
void f77_dlagv2(double * a, FINT lda, double * b, FINT ldb, double * alphar, double * alphai, double * beta, double * csl, double * snl, double * csr, double * snr);
void f77_dlahqr(FLOG wantt, FLOG wantz, FINT n, FINT ilo, FINT ihi, double * h, FINT ldh, double * wr, double * wi, FINT iloz, FINT ihiz, double * z, FINT ldz, FINT2 info);
void f77_dlahrd(FINT n, FINT k, FINT nb, double * a, FINT lda, double * tau, double * t, FINT ldt, double * y, FINT ldy);
void f77_dlaic1(FINT job, FINT j, const double * x, const double * sest, const double * w, const double * gamma, double * sestpr, double * s, double * c);
void f77_dlaln2(FLOG ltrans, FINT na, FINT nw, const double * smin, const double * ca, const double * a, FINT lda, const double * d1, const double * d2, const double * b, FINT ldb, const double * wr, const double * wi, double * x, FINT ldx, double * scale, double * xnorm, FINT2 info);
void f77_dlals0(FINT icompq, FINT nl, FINT nr, FINT sqre, FINT nrhs, double * b, FINT ldb, double * bx, FINT ldbx, FINT perm, FINT givptr, FINT givcol, FINT ldgcol, const double * givnum, FINT ldgnum, const double * poles, const double * difl, const double * difr, const double * z, FINT k, const double * c, const double * s, double * work, FINT2 info);
void f77_dlalsa(FINT icompq, FINT smlsiz, FINT n, FINT nrhs, double * b, FINT ldb, double * bx, FINT ldbx, const double * u, FINT ldu, const double * vt, FINT k, const double * difl, const double * difr, const double * z, const double * poles, FINT givptr, FINT givcol, FINT ldgcol, FINT perm, const double * givnum, const double * c, const double * s, double * work, FINT2 iwork, FINT2 info);
void f77_dlalsd(const FCHAR uplo, FINT smlsiz, FINT n, FINT nrhs, double * d, double * e, double * b, FINT ldb, const double * rcond, FINT2 rank, double * work, FINT2 iwork, FINT2 info);
void dlamchsub(double* output, const FCHAR cmach);
void f77_dlamc1(FINT2 beta, FINT2 t, FLOG2 rnd, FLOG2 ieee1);
void f77_dlamc2(FINT2 beta, FINT2 t, FLOG2 rnd, double * eps, FINT2 emin, double * rmin, FINT2 emax, double * rmax);
void dlamc3sub(double* output, const double * a, const double * b);
void f77_dlamc4(FINT2 emin, const double * start, FINT base);
void f77_dlamc5(FINT beta, FINT p, FINT emin, FLOG ieee, FINT2 emax, double * rmax);
void f77_dlamrg(FINT n1, FINT n2, const double * a, FINT dtrd1, FINT dtrd2, FINT2 index);
void dlangbsub(double* output, const FCHAR norm, FINT n, FINT kl, FINT ku, const double * ab, FINT ldab, double * work);
void dlangesub(double* output, const FCHAR norm, FINT m, FINT n, const double * a, FINT lda, double * work);
void dlangtsub(double* output, const FCHAR norm, FINT n, const double * dl, const double * d, const double * du);
void dlanhssub(double* output, const FCHAR norm, FINT n, const double * a, FINT lda, double * work);
void dlansbsub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, FINT k, const double * ab, FINT ldab, double * work);
void dlanspsub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, const double * ap, double * work);
void dlanstsub(double* output, const FCHAR norm, FINT n, const double * d, const double * e);
void dlansysub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, const double * a, FINT lda, double * work);
void dlantbsub(double* output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT k, const double * ab, FINT ldab, double * work);
void dlantpsub(double* output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const double * ap, double * work);
void dlantrsub(double* output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT m, FINT n, const double * a, FINT lda, double * work);
void f77_dlanv2(double * a, double * b, double * c, double * d, double * rt1r, double * rt1i, double * rt2r, double * rt2i, double * cs, double * sn);
void f77_dlapll(FINT n, double * x, FINT incx, double * y, FINT incy, double * ssmin);
void f77_dlapmt(FLOG forwrd, FINT m, FINT n, double * x, FINT ldx, FINT2 k);
void dlapy2sub(double* output, const double * x, const double * y);
void dlapy3sub(double* output, const double * x, const double * y, const double * z);
void f77_dlaqgb(FINT m, FINT n, FINT kl, FINT ku, double * ab, FINT ldab, const double * r, const double * c, const double * rowcnd, const double * colcnd, const double * amax, FCHAR equed);
void f77_dlaqge(FINT m, FINT n, double * a, FINT lda, const double * r, const double * c, const double * rowcnd, const double * colcnd, const double * amax, FCHAR equed);
void f77_dlaqp2(FINT m, FINT n, FINT offset, double * a, FINT lda, FINT2 jpvt, double * tau, double * vn1, double * vn2, double * work);
void f77_dlaqps(FINT m, FINT n, FINT offset, FINT nb, FINT2 kb, double * a, FINT lda, FINT2 jpvt, double * tau, double * vn1, double * vn2, double * auxv, double * f, FINT ldf);
void f77_dlaqsb(const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_dlaqsp(const FCHAR uplo, FINT n, double * ap, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_dlaqsy(const FCHAR uplo, FINT n, double * a, FINT lda, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_dlaqtr(FLOG ltran, FLOG lreal, FINT n, const double * t, FINT ldt, const double * b, const double * w, double * scale, double * x, double * work, FINT2 info);
void f77_dlar1v(FINT n, FINT b1, FINT bn, const double * sigma, const double * l, const double * d, const double * ld, const double * lld, const double * gersch, double * z, double * ztz, double * mingma, FINT2 r, FINT2 isuppz, double * work);
void f77_dlar2v(FINT n, double * x, double * y, double * z, FINT incx, const double * c, const double * s, FINT incc);
void f77_dlarf(const FCHAR side, FINT m, FINT n, const double * v, FINT incv, const double * tau, double * c, FINT ldc, double * work);
void f77_dlarfb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, const double * v, FINT ldv, const double * t, FINT ldt, double * c, FINT ldc, double * work, FINT ldwork);
void f77_dlarfg(FINT n, double * alpha, double * x, FINT incx, double * tau);
void f77_dlarft(const FCHAR direct, const FCHAR storev, FINT n, FINT k, double * v, FINT ldv, const double * tau, double * t, FINT ldt);
void f77_dlarfx(const FCHAR side, FINT m, FINT n, const double * v, const double * tau, double * c, FINT ldc, double * work);
void f77_dlargv(FINT n, double * x, FINT incx, double * y, FINT incy, double * c, FINT incc);
void f77_dlarnv(FINT idist, FINT2 iseed, FINT n, double * x);
void f77_dlarrb(FINT n, const double * d, const double * l, const double * ld, const double * lld, FINT ifirst, FINT ilast, const double * sigma, const double * reltol, double * w, double * wgap, double * werr, const double * work, FINT iwork, FINT2 info);
void f77_dlarre(FINT n, double * d, double * e, const double * tol, FINT2 nsplit, FINT2 isplit, FINT2 m, double * w, double * woff, double * gersch, const double * work, FINT2 info);
void f77_dlarrf(FINT n, const double * d, const double * l, const double * ld, const double * lld, FINT ifirst, FINT ilast, double * w, const double * sigma, double * dplus, double * lplus, double * work, FINT2 iwork, FINT2 info);
void f77_dlarrv(FINT n, double * d, double * l, FINT isplit, FINT m, const double * w, FINT iblock, const double * gersch, const double * tol, double * z, FINT ldz, FINT2 isuppz, double * work, FINT2 iwork, FINT2 info);
void f77_dlartg(const double * f, const double * g, double * cs, double * sn, double * r);
void f77_dlartv(FINT n, double * x, FINT incx, double * y, FINT incy, const double * c, const double * s, FINT incc);
void f77_dlaruv(FINT2 iseed, FINT n, double * x);
void f77_dlarz(const FCHAR side, FINT m, FINT n, FINT l, const double * v, FINT incv, const double * tau, double * c, FINT ldc, double * work);
void f77_dlarzb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, FINT l, const double * v, FINT ldv, const double * t, FINT ldt, double * c, FINT ldc, double * work, FINT ldwork);
void f77_dlarzt(const FCHAR direct, const FCHAR storev, FINT n, FINT k, double * v, FINT ldv, const double * tau, double * t, FINT ldt);
void f77_dlas2(const double * f, const double * g, const double * h, double * ssmin, double * ssmax);
void f77_dlascl(const FCHAR type, FINT kl, FINT ku, const double * cfrom, const double * cto, FINT m, FINT n, double * a, FINT lda, FINT2 info);
void f77_dlasd0(FINT n, FINT sqre, double * d, const double * e, double * u, FINT ldu, double * vt, FINT ldvt, FINT smlsiz, FINT2 iwork, double * work, FINT2 info);
void f77_dlasd1(FINT nl, FINT nr, FINT sqre, double * d, double * alpha, double * beta, double * u, FINT ldu, double * vt, FINT ldvt, FINT2 idxq, FINT2 iwork, double * work, FINT2 info);
void f77_dlasd2(FINT nl, FINT nr, FINT sqre, FINT2 k, double * d, double * z, const double * alpha, const double * beta, double * u, FINT ldu, double * vt, FINT ldvt, double * dsigma, double * u2, FINT ldu2, double * vt2, FINT ldvt2, FINT2 idxp, FINT2 idx, FINT2 idxc, FINT2 idxq, FINT2 coltyp, FINT2 info);
void f77_dlasd3(FINT nl, FINT nr, FINT sqre, FINT k, double * d, double * q, FINT ldq, const double * dsigma, double * u, FINT ldu, double * u2, FINT ldu2, double * vt, FINT ldvt, double * vt2, FINT ldvt2, FINT idxc, FINT ctot, const double * z, FINT2 info);
void f77_dlasd4(FINT n, FINT i, const double * d, const double * z, double * delta, const double * rho, double * sigma, double * work, FINT2 info);
void f77_dlasd5(FINT i, const double * d, const double * z, double * delta, const double * rho, double * dsigma, double * work);
void f77_dlasd6(FINT icompq, FINT nl, FINT nr, FINT sqre, double * d, double * vf, double * vl, double * alpha, double * beta, FINT2 idxq, FINT2 perm, FINT2 givptr, FINT2 givcol, FINT ldgcol, double * givnum, FINT ldgnum, double * poles, double * difl, double * difr, double * z, FINT2 k, double * c, double * s, double * work, FINT2 iwork, FINT2 info);
void f77_dlasd7(FINT icompq, FINT nl, FINT nr, FINT sqre, FINT2 k, double * d, double * z, double * zw, double * vf, double * vfw, double * vl, double * vlw, const double * alpha, const double * beta, double * dsigma, FINT2 idx, FINT2 idxp, FINT idxq, FINT2 perm, FINT2 givptr, FINT2 givcol, FINT ldgcol, double * givnum, FINT ldgnum, double * c, double * s, FINT2 info);
void f77_dlasd8(FINT icompq, FINT k, double * d, const double * z, double * vf, double * vl, double * difl, double * difr, FINT lddifr, const double * dsigma, double * work, FINT2 info);
void f77_dlasda(FINT icompq, FINT smlsiz, FINT n, FINT sqre, double * d, const double * e, double * u, FINT ldu, double * vt, FINT2 k, double * difl, double * difr, double * z, double * poles, FINT2 givptr, FINT2 givcol, FINT ldgcol, FINT2 perm, double * givnum, double * c, double * s, double * work, FINT2 iwork, FINT2 info);
void f77_dlasdq(const FCHAR uplo, FINT sqre, FINT n, FINT ncvt, FINT nru, FINT ncc, double * d, double * e, double * vt, FINT ldvt, double * u, FINT ldu, double * c, FINT ldc, double * work, FINT2 info);
void f77_dlasdt(FINT n, FINT2 lvl, FINT2 nd, FINT2 inode, FINT2 ndiml, FINT2 ndimr, FINT msub);
void f77_dlaset(const FCHAR uplo, FINT m, FINT n, const double * alpha, const double * beta, double * a, FINT lda);
void f77_dlasq1(FINT n, double * d, double * e, double * work, FINT2 info);
void f77_dlasq2(FINT n, double * z, FINT2 info);
void f77_dlasq3(FINT i0, FINT n0, const double * z, FINT pp, double * dmin, double * sigma, double * desig, const double * qmax, FINT2 nfail, FINT2 iter, FINT2 ndiv, FINT2 ttype, FLOG ieee);
void f77_dlasq4(FINT i0, FINT n0, const double * z, FINT pp, FINT n0in, const double * dmin, const double * dmin1, const double * dmin2, const double * dn, const double * dn1, const double * dn2, double * tau, FINT2 ttype);
void f77_dlasq5(FINT i0, FINT n0, const double * z, FINT pp, const double * tau, double * dmin, double * dmin1, double * dmin2, double * dn, double * dnm1, double * dnm2, FLOG ieee);
void f77_dlasq6(FINT i0, FINT n0, const double * z, FINT pp, double * dmin, double * dmin1, double * dmin2, double * dn, double * dnm1, double * dnm2);
void f77_dlasr(const FCHAR side, const FCHAR pivot, const FCHAR direct, FINT m, FINT n, const double * c, const double * s, double * a, FINT lda);
void f77_dlasrt(const FCHAR id, FINT n, double * d, FINT2 info);
void f77_dlassq(FINT n, const double * x, FINT incx, double * scale, double * sumsq);
void f77_dlasv2(const double * f, const double * g, const double * h, double * ssmin, double * ssmax, double * snl, double * csl, double * snr, double * csr);
void f77_dlaswp(FINT n, double * a, FINT lda, FINT k1, FINT k2, FINT ipiv, FINT incx);
void f77_dlasy2(FLOG ltranl, FLOG ltranr, FINT isgn, FINT n1, FINT n2, const double * tl, FINT ldtl, const double * tr, FINT ldtr, const double * b, FINT ldb, double * scale, double * x, FINT ldx, double * xnorm, FINT2 info);
void f77_dlasyf(const FCHAR uplo, FINT n, FINT nb, FINT2 kb, double * a, FINT lda, FINT2 ipiv, double * w, FINT ldw, FINT2 info);
void f77_dlatbs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, FINT kd, const double * ab, FINT ldab, double * x, double * scale, double * cnorm, FINT2 info);
void f77_dlatdf(FINT ijob, FINT n, const double * z, FINT ldz, double * rhs, double * rdsum, double * rdscal, FINT ipiv, FINT jpiv);
void f77_dlatps(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const double * ap, double * x, double * scale, double * cnorm, FINT2 info);
void f77_dlatrd(const FCHAR uplo, FINT n, FINT nb, double * a, FINT lda, double * e, double * tau, double * w, FINT ldw);
void f77_dlatrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const double * a, FINT lda, double * x, double * scale, double * cnorm, FINT2 info);
void f77_dlatrz(FINT m, FINT n, FINT l, double * a, FINT lda, double * tau, double * work);
void f77_dlatzm(const FCHAR side, FINT m, FINT n, const double * v, FINT incv, const double * tau, double * c1, double * c2, FINT ldc, double * work);
void f77_dlauu2(const FCHAR uplo, FINT n, double * a, FINT lda, FINT2 info);
void f77_dlauum(const FCHAR uplo, FINT n, double * a, FINT lda, FINT2 info);
void f77_dlazq3(FINT i0, FINT n0, const double * z, FINT pp, double * dmin, double * sigma, double * desig, const double * qmax, FINT2 nfail, FINT2 iter, FINT2 ndiv, FLOG ieee, FINT2 ttype, float * dmin1, float * dmin2, float * dn, float * dn1, float * dn2, float * tau);
void f77_dlazq4(FINT i0, FINT n0, const double * z, FINT pp, FINT n0in, const double * dmin, const double * dmin1, const double * dmin2, const double * dn, const double * dn1, const double * dn2, double * tau, FINT2 ttype, double * g);
void f77_dopgtr(const FCHAR uplo, FINT n, const double * ap, const double * tau, double * q, FINT ldq, double * work, FINT2 info);
void f77_dopmtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const double * ap, const double * tau, double * c, FINT ldc, double * work, FINT2 info);
void f77_dorg2l(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT2 info);
void f77_dorg2r(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT2 info);
void f77_dorgbr(const FCHAR vect, FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT lwork, FINT2 info);
void f77_dorghr(FINT n, FINT ilo, FINT ihi, double * a, FINT lda, const double * tau, double * work, FINT lwork, FINT2 info);
void f77_dorgl2(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT2 info);
void f77_dorglq(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT lwork, FINT2 info);
void f77_dorgql(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT lwork, FINT2 info);
void f77_dorgqr(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT lwork, FINT2 info);
void f77_dorgr2(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT2 info);
void f77_dorgrq(FINT m, FINT n, FINT k, double * a, FINT lda, const double * tau, double * work, FINT lwork, FINT2 info);
void f77_dorgtr(const FCHAR uplo, FINT n, double * a, FINT lda, const double * tau, double * work, FINT lwork, FINT2 info);
void f77_dorm2l(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT2 info);
void f77_dorm2r(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT2 info);
void f77_dormbr(const FCHAR vect, const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dormhr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT ilo, FINT ihi, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dorml2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT2 info);
void f77_dormlq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dormql(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dormqr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dormr2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT2 info);
void f77_dormr3(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT2 info);
void f77_dormrq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dormrz(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dormtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const double * a, FINT lda, const double * tau, double * c, FINT ldc, double * work, FINT lwork, FINT2 info);
void f77_dpbcon(const FCHAR uplo, FINT n, FINT kd, const double * ab, FINT ldab, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dpbequ(const FCHAR uplo, FINT n, FINT kd, const double * ab, FINT ldab, double * s, double * scond, double * amax, FINT2 info);
void f77_dpbrfs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const double * ab, FINT ldab, const double * afb, FINT ldafb, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dpbstf(const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, FINT2 info);
void f77_dpbsv(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, double * ab, FINT ldab, double * b, FINT ldb, FINT2 info);
void f77_dpbsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT kd, FINT nrhs, double * ab, FINT ldab, double * afb, FINT ldafb, FCHAR equed, double * s, double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dpbtf2(const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, FINT2 info);
void f77_dpbtrf(const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, FINT2 info);
void f77_dpbtrs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const double * ab, FINT ldab, double * b, FINT ldb, FINT2 info);
void f77_dpocon(const FCHAR uplo, FINT n, const double * a, FINT lda, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dpoequ(FINT n, const double * a, FINT lda, double * s, double * scond, double * amax, FINT2 info);
void f77_dporfs(const FCHAR uplo, FINT n, FINT nrhs, const double * a, FINT lda, const double * af, FINT ldaf, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dposv(const FCHAR uplo, FINT n, FINT nrhs, double * a, FINT lda, double * b, FINT ldb, FINT2 info);
void f77_dposvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, double * a, FINT lda, double * af, FINT ldaf, FCHAR equed, double * s, double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dpotf2(const FCHAR uplo, FINT n, double * a, FINT lda, FINT2 info);
void f77_dpotrf(const FCHAR uplo, FINT n, double * a, FINT lda, FINT2 info);
void f77_dpotri(const FCHAR uplo, FINT n, double * a, FINT lda, FINT2 info);
void f77_dpotrs(const FCHAR uplo, FINT n, FINT nrhs, const double * a, FINT lda, double * b, FINT ldb, FINT2 info);
void f77_dppcon(const FCHAR uplo, FINT n, const double * ap, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dppequ(const FCHAR uplo, FINT n, const double * ap, double * s, double * scond, double * amax, FINT2 info);
void f77_dpprfs(const FCHAR uplo, FINT n, FINT nrhs, const double * ap, const double * afp, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dppsv(const FCHAR uplo, FINT n, FINT nrhs, double * ap, double * b, FINT ldb, FINT2 info);
void f77_dppsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, double * ap, double * afp, FCHAR equed, double * s, double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dpptrf(const FCHAR uplo, FINT n, double * ap, FINT2 info);
void f77_dpptri(const FCHAR uplo, FINT n, double * ap, FINT2 info);
void f77_dpptrs(const FCHAR uplo, FINT n, FINT nrhs, const double * ap, double * b, FINT ldb, FINT2 info);
void f77_dptcon(FINT n, const double * d, const double * e, const double * anorm, double * rcond, double * work, FINT2 info);
void f77_dpteqr(const FCHAR compz, FINT n, double * d, double * e, double * z, FINT ldz, double * work, FINT2 info);
void f77_dptrfs(FINT n, FINT nrhs, const double * d, const double * e, const double * df, const double * ef, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 info);
void f77_dptsv(FINT n, FINT nrhs, double * d, double * e, double * b, FINT ldb, FINT2 info);
void f77_dptsvx(const FCHAR fact, FINT n, FINT nrhs, const double * d, const double * e, double * df, double * ef, const double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 info);
void f77_dpttrf(FINT n, double * d, double * e, FINT2 info);
void f77_dpttrs(FINT n, FINT nrhs, const double * d, const double * e, double * b, FINT ldb, FINT2 info);
void f77_dptts2(FINT n, FINT nrhs, const double * d, const double * e, double * b, FINT ldb);
void f77_drscl(FINT n, const double * sa, double * sx, FINT incx);
void f77_dsbev(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, double * w, double * z, FINT ldz, double * work, FINT2 info);
void f77_dsbevd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, double * w, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dsbevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, double * q, FINT ldq, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, double * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dsbgst(const FCHAR vect, const FCHAR uplo, FINT n, FINT ka, FINT kb, double * ab, FINT ldab, const double * bb, FINT ldbb, double * x, FINT ldx, double * work, FINT2 info);
void f77_dsbgv(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, double * ab, FINT ldab, double * bb, FINT ldbb, double * w, double * z, FINT ldz, double * work, FINT2 info);
void f77_dsbgvd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, double * ab, FINT ldab, double * bb, FINT ldbb, double * w, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dsbgvx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT ka, FINT kb, double * ab, FINT ldab, double * bb, FINT ldbb, double * q, FINT ldq, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, double * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dsbtrd(const FCHAR vect, const FCHAR uplo, FINT n, FINT kd, double * ab, FINT ldab, double * d, double * e, double * q, FINT ldq, double * work, FINT2 info);
void dsecndsub(double* output);
void f77_dspcon(const FCHAR uplo, FINT n, const double * ap, FINT ipiv, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dspev(const FCHAR jobz, const FCHAR uplo, FINT n, double * ap, double * w, double * z, FINT ldz, double * work, FINT2 info);
void f77_dspevd(const FCHAR jobz, const FCHAR uplo, FINT n, double * ap, double * w, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dspevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, double * ap, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, double * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dspgst(FINT itype, const FCHAR uplo, FINT n, double * ap, const double * bp, FINT2 info);
void f77_dspgv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, double * ap, double * bp, double * w, double * z, FINT ldz, double * work, FINT2 info);
void f77_dspgvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, double * ap, double * bp, double * w, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dspgvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, double * ap, double * bp, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, double * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dsprfs(const FCHAR uplo, FINT n, FINT nrhs, const double * ap, const double * afp, FINT ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dspsv(const FCHAR uplo, FINT n, FINT nrhs, double * ap, FINT2 ipiv, double * b, FINT ldb, FINT2 info);
void f77_dspsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const double * ap, double * afp, FINT2 ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dsptrd(const FCHAR uplo, FINT n, double * ap, double * d, double * e, double * tau, FINT2 info);
void f77_dsptrf(const FCHAR uplo, FINT n, double * ap, FINT2 ipiv, FINT2 info);
void f77_dsptri(const FCHAR uplo, FINT n, double * ap, FINT ipiv, double * work, FINT2 info);
void f77_dsptrs(const FCHAR uplo, FINT n, FINT nrhs, const double * ap, FINT ipiv, double * b, FINT ldb, FINT2 info);
void f77_dstebz(const FCHAR range, const FCHAR order, FINT n, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, const double * d, const double * e, FINT2 m, FINT2 nsplit, double * w, FINT2 iblock, FINT2 isplit, double * work, FINT2 iwork, FINT2 info);
void f77_dstedc(const FCHAR compz, FINT n, double * d, double * e, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dstegr(const FCHAR jobz, const FCHAR range, FINT n, double * d, double * e, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, FINT2 isuppz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dstein(FINT n, const double * d, const double * e, FINT m, const double * w, FINT iblock, FINT isplit, double * z, FINT ldz, double * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dsteqr(const FCHAR compz, FINT n, double * d, double * e, double * z, FINT ldz, double * work, FINT2 info);
void f77_dsterf(FINT n, double * d, double * e, FINT2 info);
void f77_dstev(const FCHAR jobz, FINT n, double * d, double * e, double * z, FINT ldz, double * work, FINT2 info);
void f77_dstevd(const FCHAR jobz, FINT n, double * d, double * e, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dstevr(const FCHAR jobz, const FCHAR range, FINT n, double * d, double * e, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, FINT2 isuppz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dstevx(const FCHAR jobz, const FCHAR range, FINT n, double * d, double * e, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, double * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dsycon(const FCHAR uplo, FINT n, const double * a, FINT lda, FINT ipiv, const double * anorm, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dsyev(const FCHAR jobz, const FCHAR uplo, FINT n, double * a, FINT lda, double * w, double * work, FINT lwork, FINT2 info);
void f77_dsyevd(const FCHAR jobz, const FCHAR uplo, FINT n, double * a, FINT lda, double * w, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dsyevr(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, double * a, FINT lda, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, FINT2 isuppz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dsyevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, double * a, FINT lda, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dsygs2(FINT itype, const FCHAR uplo, FINT n, double * a, FINT lda, const double * b, FINT ldb, FINT2 info);
void f77_dsygst(FINT itype, const FCHAR uplo, FINT n, double * a, FINT lda, const double * b, FINT ldb, FINT2 info);
void f77_dsygv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, double * a, FINT lda, double * b, FINT ldb, double * w, double * work, FINT lwork, FINT2 info);
void f77_dsygvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, double * a, FINT lda, double * b, FINT ldb, double * w, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dsygvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, double * a, FINT lda, double * b, FINT ldb, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, double * z, FINT ldz, double * work, FINT lwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_dsyrfs(const FCHAR uplo, FINT n, FINT nrhs, const double * a, FINT lda, const double * af, FINT ldaf, FINT ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dsysv(const FCHAR uplo, FINT n, FINT nrhs, double * a, FINT lda, FINT2 ipiv, double * b, FINT ldb, double * work, FINT lwork, FINT2 info);
void f77_dsysvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const double * a, FINT lda, double * af, FINT ldaf, FINT2 ipiv, const double * b, FINT ldb, double * x, FINT ldx, double * rcond, double * ferr, double * berr, double * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_dsytd2(const FCHAR uplo, FINT n, double * a, FINT lda, double * d, double * e, double * tau, FINT2 info);
void f77_dsytf2(const FCHAR uplo, FINT n, double * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_dsytrd(const FCHAR uplo, FINT n, double * a, FINT lda, double * d, double * e, double * tau, double * work, FINT lwork, FINT2 info);
void f77_dsytrf(const FCHAR uplo, FINT n, double * a, FINT lda, FINT2 ipiv, double * work, FINT lwork, FINT2 info);
void f77_dsytri(const FCHAR uplo, FINT n, double * a, FINT lda, FINT ipiv, double * work, FINT2 info);
void f77_dsytrs(const FCHAR uplo, FINT n, FINT nrhs, const double * a, FINT lda, FINT ipiv, double * b, FINT ldb, FINT2 info);
void f77_dtbcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT kd, const double * ab, FINT ldab, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dtbrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const double * ab, FINT ldab, const double * b, FINT ldb, const double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dtbtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const double * ab, FINT ldab, double * b, FINT ldb, FINT2 info);
void f77_dtgevc(const FCHAR side, const FCHAR howmny, FLOG select, FINT n, const double * s, FINT lds, const double * p, FINT ldp, double * vl, FINT ldvl, double * vr, FINT ldvr, FINT mm, FINT2 m, double * work, FINT2 info);
void f77_dtgex2(FLOG wantq, FLOG wantz, FINT n, double * a, FINT lda, double * b, FINT ldb, double * q, FINT ldq, double * z, FINT ldz, FINT j1, FINT n1, FINT n2, double * work, FINT lwork, FINT2 info);
void f77_dtgexc(FLOG wantq, FLOG wantz, FINT n, double * a, FINT lda, double * b, FINT ldb, double * q, FINT ldq, double * z, FINT ldz, FINT2 ifst, FINT2 ilst, double * work, FINT lwork, FINT2 info);
void f77_dtgsen(FINT ijob, FLOG wantq, FLOG wantz, FLOG select, FINT n, double * a, FINT lda, double * b, FINT ldb, double * alphar, double * alphai, double * beta, double * q, FINT ldq, double * z, FINT ldz, FINT2 m, double * pl, double * pr, double * dif, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dtgsja(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, FINT k, FINT l, double * a, FINT lda, double * b, FINT ldb, const double * tola, const double * tolb, double * alpha, double * beta, double * u, FINT ldu, double * v, FINT ldv, double * q, FINT ldq, double * work, FINT2 ncycle, FINT2 info);
void f77_dtgsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const double * a, FINT lda, const double * b, FINT ldb, const double * vl, FINT ldvl, const double * vr, FINT ldvr, double * s, double * dif, FINT mm, FINT2 m, double * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_dtgsy2(const FCHAR trans, FINT ijob, FINT m, FINT n, const double * a, FINT lda, const double * b, FINT ldb, double * c, FINT ldc, const double * d, FINT ldd, const double * e, FINT lde, double * f, FINT ldf, double * scale, double * rdsum, double * rdscal, FINT2 iwork, FINT2 pq, FINT2 info);
void f77_dtgsyl(const FCHAR trans, FINT ijob, FINT m, FINT n, const double * a, FINT lda, const double * b, FINT ldb, double * c, FINT ldc, const double * d, FINT ldd, const double * e, FINT lde, double * f, FINT ldf, double * dif, double * scale, double * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_dtpcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const double * ap, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dtprfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const double * ap, const double * b, FINT ldb, const double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dtptri(const FCHAR uplo, const FCHAR diag, FINT n, double * ap, FINT2 info);
void f77_dtptrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const double * ap, double * b, FINT ldb, FINT2 info);
void f77_dtrcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const double * a, FINT lda, double * rcond, double * work, FINT2 iwork, FINT2 info);
void f77_dtrevc(const FCHAR side, const FCHAR howmny, FLOG2 select, FINT n, const double * t, FINT ldt, double * vl, FINT ldvl, double * vr, FINT ldvr, FINT mm, FINT2 m, double * work, FINT2 info);
void f77_dtrexc(const FCHAR compq, FINT n, double * t, FINT ldt, double * q, FINT ldq, FINT2 ifst, FINT2 ilst, double * work, FINT2 info);
void f77_dtrrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const double * a, FINT lda, const double * b, FINT ldb, const double * x, FINT ldx, double * ferr, double * berr, double * work, FINT2 iwork, FINT2 info);
void f77_dtrsen(const FCHAR job, const FCHAR compq, FLOG select, FINT n, double * t, FINT ldt, double * q, FINT ldq, double * wr, double * wi, FINT2 m, double * s, double * sep, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_dtrsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const double * t, FINT ldt, const double * vl, FINT ldvl, const double * vr, FINT ldvr, double * s, double * sep, FINT mm, FINT2 m, double * work, FINT ldwork, FINT2 iwork, FINT2 info);
void f77_dtrsyl(const FCHAR trana, const FCHAR tranb, FINT isgn, FINT m, FINT n, const double * a, FINT lda, const double * b, FINT ldb, double * c, FINT ldc, double * scale, FINT2 info);
void f77_dtrti2(const FCHAR uplo, const FCHAR diag, FINT n, double * a, FINT lda, FINT2 info);
void f77_dtrtri(const FCHAR uplo, const FCHAR diag, FINT n, double * a, FINT lda, FINT2 info);
void f77_dtrtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const double * a, FINT lda, double * b, FINT ldb, FINT2 info);
void f77_dtzrqf(FINT m, FINT n, double * a, FINT lda, double * tau, FINT2 info);
void f77_dtzrzf(FINT m, FINT n, double * a, FINT lda, double * tau, double * work, FINT lwork, FINT2 info);
void dzsum1sub(double* output, FINT n, const void *cx, FINT incx);
void icmax1sub(FINT output, FINT n, const void * cx, FINT incx);
void ieeecksub(FINT output, FINT ispec, const float * zero, const float * one);
void ilaenvsub(FINT output, FINT ispec, const FCHAR name, const FCHAR opts, FINT n1, FINT n2, FINT n3, FINT n4);
void f77_ilaver(FINT2 vers_major, FINT2 vers_minor, FINT2 vers_patch);
void izmax1sub(FINT output, FINT n, const void *cx, FINT incx);
void lsamesub(FLOG output, const FCHAR ca, const FCHAR cb);
void lsamensub(FLOG output, FINT n, const FCHAR ca, const FCHAR cb);
void f77_sbdsdc(const FCHAR uplo, const FCHAR compq, FINT n, float * d, float * e, float * u, FINT ldu, float * vt, FINT ldvt, float * q, FINT2 iq, float * work, FINT2 iwork, FINT2 info);
void f77_sbdsqr(const FCHAR uplo, FINT n, FINT ncvt, FINT nru, FINT ncc, float * d, float * e, float * vt, FINT ldvt, float * u, FINT ldu, float * c, FINT ldc, float * work, FINT2 info);
void scsum1sub(float output, FINT n, const void * cx, FINT incx);
void f77_sdisna(const FCHAR job, FINT m, FINT n, const float * d, float * sep, FINT2 info);
void secondsub(float output);
void f77_sgbbrd(const FCHAR vect, FINT m, FINT n, FINT ncc, FINT kl, FINT ku, float * ab, FINT ldab, float * d, float * e, float * q, FINT ldq, float * pt, FINT ldpt, float * c, FINT ldc, float * work, FINT2 info);
void f77_sgbcon(const FCHAR norm, FINT n, FINT kl, FINT ku, const float * ab, FINT ldab, FINT ipiv, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_sgbequ(FINT m, FINT n, FINT kl, FINT ku, const float * ab, FINT ldab, float * r, float * c, float * rowcnd, float * colcnd, float * amax, FINT2 info);
void f77_sgbrfs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const float * ab, FINT ldab, const float * afb, FINT ldafb, FINT ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sgbsv(FINT n, FINT kl, FINT ku, FINT nrhs, float * ab, FINT ldab, FINT2 ipiv, float * b, FINT ldb, FINT2 info);
void f77_sgbsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, float * ab, FINT ldab, float * afb, FINT ldafb, FINT2 ipiv, FCHAR equed, float * r, float * c, float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sgbtf2(FINT m, FINT n, FINT kl, FINT ku, float * ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_sgbtrf(FINT m, FINT n, FINT kl, FINT ku, float * ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_sgbtrs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const float * ab, FINT ldab, FINT ipiv, float * b, FINT ldb, FINT2 info);
void f77_sgebak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const float * scale, FINT m, float * v, FINT ldv, FINT2 info);
void f77_sgebal(const FCHAR job, FINT n, float * a, FINT lda, FINT2 ilo, FINT2 ihi, float * scale, FINT2 info);
void f77_sgebd2(FINT m, FINT n, float * a, FINT lda, float * d, float * e, float * tauq, float * taup, float * work, FINT2 info);
void f77_sgebrd(FINT m, FINT n, float * a, FINT lda, float * d, float * e, float * tauq, float * taup, float * work, FINT lwork, FINT2 info);
void f77_sgecon(const FCHAR norm, FINT n, const float * a, FINT lda, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_sgeequ(FINT m, FINT n, const float * a, FINT lda, float * r, float * c, float * rowcnd, float * colcnd, float * amax, FINT2 info);
void f77_sgees(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (float*,float*), FINT n, float * a, FINT lda, FINT2 sdim, float * wr, float * wi, float * vs, FINT ldvs, float * work, FINT lwork, long int * bwork, FINT2 info);
void f77_sgeesx(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (float*,float*), const FCHAR sense, FINT n, float * a, FINT lda, FINT2 sdim, float * wr, float * wi, float * vs, FINT ldvs, float * rconde, float * rcondv, float * work, FINT lwork, FINT2 iwork, FINT liwork, long int * bwork, FINT2 info);
void f77_sgeev(const FCHAR jobvl, const FCHAR jobvr, FINT n, float * a, FINT lda, float * wr, float * wi, float * vl, FINT ldvl, float * vr, FINT ldvr, float * work, FINT lwork, FINT2 info);
void f77_sgeevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, float * a, FINT lda, float * wr, float * wi, float * vl, FINT ldvl, float * vr, FINT ldvr, FINT2 ilo, FINT2 ihi, float * scale, float * abnrm, float * rconde, float * rcondv, float * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_sgegs(const FCHAR jobvsl, const FCHAR jobvsr, FINT n, float * a, FINT lda, float * b, FINT ldb, float * alphar, float * alphai, float * beta, float * vsl, FINT ldvsl, float * vsr, FINT ldvsr, float * work, FINT lwork, FINT2 info);
void f77_sgegv(const FCHAR jobvl, const FCHAR jobvr, FINT n, float * a, FINT lda, float * b, FINT ldb, float * alphar, float * alphai, float * beta, float * vl, FINT ldvl, float * vr, FINT ldvr, float * work, FINT lwork, FINT2 info);
void f77_sgehd2(FINT n, FINT ilo, FINT ihi, float * a, FINT lda, float * tau, float * work, FINT2 info);
void f77_sgehrd(FINT n, FINT ilo, FINT ihi, float * a, FINT lda, float * tau, float * work, FINT lwork, FINT2 info);
void f77_sgelq2(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT2 info);
void f77_sgelqf(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT lwork, FINT2 info);
void f77_sgels(const FCHAR trans, FINT m, FINT n, FINT nrhs, float * a, FINT lda, float * b, FINT ldb, float * work, FINT lwork, FINT2 info);
void f77_sgelsd(FINT m, FINT n, FINT nrhs, const float * a, FINT lda, float * b, FINT ldb, float * s, const float * rcond, FINT2 rank, float * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_sgelss(FINT m, FINT n, FINT nrhs, float * a, FINT lda, float * b, FINT ldb, float * s, const float * rcond, FINT2 rank, float * work, FINT lwork, FINT2 info);
void f77_sgelsx(FINT m, FINT n, FINT nrhs, float * a, FINT lda, float * b, FINT ldb, FINT2 jpvt, const float * rcond, FINT2 rank, float * work, FINT2 info);
void f77_sgelsy(FINT m, FINT n, FINT nrhs, float * a, FINT lda, float * b, FINT ldb, FINT2 jpvt, const float * rcond, FINT2 rank, float * work, FINT lwork, FINT2 info);
void f77_sgeql2(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT2 info);
void f77_sgeqlf(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT lwork, FINT2 info);
void f77_sgeqp3(FINT m, FINT n, float * a, FINT lda, FINT2 jpvt, float * tau, float * work, FINT lwork, FINT2 info);
void f77_sgeqpf(FINT m, FINT n, float * a, FINT lda, FINT2 jpvt, float * tau, float * work, FINT2 info);
void f77_sgeqr2(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT2 info);
void f77_sgeqrf(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT lwork, FINT2 info);
void f77_sgerfs(const FCHAR trans, FINT n, FINT nrhs, const float * a, FINT lda, const float * af, FINT ldaf, FINT ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sgerq2(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT2 info);
void f77_sgerqf(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT lwork, FINT2 info);
void f77_sgesc2(FINT n, const float * a, FINT lda, float * rhs, FINT ipiv, FINT jpiv, float * scale);
void f77_sgesdd(const FCHAR jobz, FINT m, FINT n, float * a, FINT lda, float * s, float * u, FINT ldu, float * vt, FINT ldvt, float * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_sgesv(FINT n, FINT nrhs, float * a, FINT lda, FINT2 ipiv, float * b, FINT ldb, FINT2 info);
void f77_sgesvd(const FCHAR jobu, const FCHAR jobvt, FINT m, FINT n, float * a, FINT lda, float * s, float * u, FINT ldu, float * vt, FINT ldvt, float * work, FINT lwork, FINT2 info);
void f77_sgesvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, float * a, FINT lda, float * af, FINT ldaf, FINT2 ipiv, FCHAR equed, float * r, float * c, float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sgetc2(FINT n, float * a, FINT lda, FINT2 ipiv, FINT2 jpiv, FINT2 info);
void f77_sgetf2(FINT m, FINT n, float * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_sgetrf(FINT m, FINT n, float * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_sgetri(FINT n, float * a, FINT lda, FINT ipiv, float * work, FINT lwork, FINT2 info);
void f77_sgetrs(const FCHAR trans, FINT n, FINT nrhs, const float * a, FINT lda, FINT ipiv, float * b, FINT ldb, FINT2 info);
void f77_sggbak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const float * lscale, const float * rscale, FINT m, float * v, FINT ldv, FINT2 info);
void f77_sggbal(const FCHAR job, FINT n, float * a, FINT lda, float * b, FINT ldb, FINT2 ilo, FINT2 ihi, float * lscale, float * rscale, float * work, FINT2 info);
void f77_sgges(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (float*,float*,float*), FINT n, float * a, FINT lda, float * b, FINT ldb, FINT2 sdim, float * alphar, float * alphai, float * beta, float * vsl, FINT ldvsl, float * vsr, FINT ldvsr, float * work, FINT lwork, long int * bwork, FINT2 info);
void f77_sggesx(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (float*,float*,float*), const FCHAR sense, FINT n, float * a, FINT lda, float * b, FINT ldb, FINT2 sdim, float * alphar, float * alphai, float * beta, float * vsl, FINT ldvsl, float * vsr, FINT ldvsr, float * rconde, float * rcondv, float * work, FINT lwork, FINT2 iwork, FINT liwork, long int * bwork, FINT2 info);
void f77_sggev(const FCHAR jobvl, const FCHAR jobvr, FINT n, float * a, FINT lda, float * b, FINT ldb, float * alphar, float * alphai, float * beta, float * vl, FINT ldvl, float * vr, FINT ldvr, float * work, FINT lwork, FINT2 info);
void f77_sggevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, float * a, FINT lda, float * b, FINT ldb, float * alphar, float * alphai, float * beta, float * vl, FINT ldvl, float * vr, FINT ldvr, FINT2 ilo, FINT2 ihi, float * lscale, float * rscale, float * abnrm, float * bbnrm, float * rconde, float * rcondv, float * work, FINT lwork, FINT2 iwork, long int * bwork, FINT2 info);
void f77_sggglm(FINT n, FINT m, FINT p, float * a, FINT lda, float * b, FINT ldb, float * d, float * x, float * y, float * work, FINT lwork, FINT2 info);
void f77_sgghrd(const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, float * a, FINT lda, float * b, FINT ldb, float * q, FINT ldq, float * z, FINT ldz, FINT2 info);
void f77_sgglse(FINT m, FINT n, FINT p, float * a, FINT lda, float * b, FINT ldb, float * c, float * d, float * x, float * work, FINT lwork, FINT2 info);
void f77_sggqrf(FINT n, FINT m, FINT p, float * a, FINT lda, float * taua, float * b, FINT ldb, float * taub, float * work, FINT lwork, FINT2 info);
void f77_sggrqf(FINT m, FINT p, FINT n, float * a, FINT lda, float * taua, float * b, FINT ldb, float * taub, float * work, FINT lwork, FINT2 info);
void f77_sggsvd(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT n, FINT p, FINT2 k, FINT2 l, float * a, FINT lda, float * b, FINT ldb, float * alpha, float * beta, float * u, FINT ldu, float * v, FINT ldv, float * q, FINT ldq, float * work, FINT2 iwork, FINT2 info);
void f77_sggsvp(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, float * a, FINT lda, float * b, FINT ldb, const float * tola, const float * tolb, FINT2 k, FINT2 l, float * u, FINT ldu, float * v, FINT ldv, float * q, FINT ldq, FINT2 iwork, float * tau, float * work, FINT2 info);
void f77_sgtcon(const FCHAR norm, FINT n, const float * dl, const float * d, const float * du, const float * du2, FINT ipiv, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_sgtrfs(const FCHAR trans, FINT n, FINT nrhs, const float * dl, const float * d, const float * du, const float * dlf, const float * df, const float * duf, const float * du2, FINT ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sgtsv(FINT n, FINT nrhs, float * dl, float * d, float * du, float * b, FINT ldb, FINT2 info);
void f77_sgtsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, const float * dl, const float * d, const float * du, float * dlf, float * df, float * duf, float * du2, FINT2 ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sgttrf(FINT n, float * dl, float * d, float * du, float * du2, FINT2 ipiv, FINT2 info);
void f77_sgttrs(const FCHAR trans, FINT n, FINT nrhs, const float * dl, const float * d, const float * du, const float * du2, FINT ipiv, float * b, FINT ldb, FINT2 info);
void f77_sgtts2(FINT itrans, FINT n, FINT nrhs, const float * dl, const float * d, const float * du, const float * du2, FINT ipiv, float * b, FINT ldb);
void f77_shgeqz(const FCHAR job, const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, float * h, FINT ldh, float * t, FINT ldt, float * alphar, float * alphai, float * beta, float * q, FINT ldq, float * z, FINT ldz, float * work, FINT lwork, FINT2 info);
void f77_shsein(const FCHAR side, const FCHAR eigsrc, const FCHAR initv, FLOG2 select, FINT n, const float * h, FINT ldh, float * wr, const float * wi, float * vl, FINT ldvl, float * vr, FINT ldvr, FINT mm, FINT2 m, float * work, FINT2 ifaill, FINT2 ifailr, FINT2 info);
void f77_shseqr(const FCHAR job, const FCHAR compz, FINT n, FINT ilo, FINT ihi, float * h, FINT ldh, float * wr, float * wi, float * z, FINT ldz, float * work, FINT lwork, FINT2 info);
void f77_slabad(float * small, float * large);
void f77_slabrd(FINT m, FINT n, FINT nb, float * a, FINT lda, float * d, float * e, float * tauq, float * taup, float * x, FINT ldx, float * y, FINT ldy);
void f77_slacn2(FINT n, float * v, float * x, FINT2 isgn, float * est, FINT2 kase, FINT2 isave);
void f77_slacon(FINT n, float * v, float * x, FINT2 isgn, float * est, FINT2 kase);
void f77_slacpy(const FCHAR uplo, FINT m, FINT n, const float * a, FINT lda, float * b, FINT ldb);
void f77_sladiv(const float * a, const float * b, const float * c, const float * d, float * p, float * q);
void f77_slae2(const float * a, const float * b, const float * c, float * rt1, float * rt2);
void f77_slaebz(FINT ijob, FINT nitmax, FINT n, FINT mmax, FINT minp, FINT nbmin, const float * abstol, const float * reltol, const float * pivmin, const float * d, const float * e, const float * e2, FINT2 nval, float * ab, float * c, FINT2 mout, FINT2 nab, float * work, FINT2 iwork, FINT2 info);
void f77_slaed0(FINT icompq, FINT qsiz, FINT n, float * d, const float * e, float * q, FINT ldq, float * qstore, FINT ldqs, float * work, FINT2 iwork, FINT2 info);
void f77_slaed1(FINT n, float * d, float * q, FINT ldq, FINT2 indxq, const float * rho, FINT cutpnt, float * work, FINT2 iwork, FINT2 info);
void f77_slaed2(FINT2 k, FINT n, FINT n1, float * d, float * q, FINT ldq, FINT2 indxq, float * rho, const float * z, float * dlamda, float * w, float * q2, FINT2 indx, FINT2 indxc, FINT2 indxp, FINT2 coltyp, FINT2 info);
void f77_slaed3(FINT k, FINT n, FINT n1, float * d, float * q, FINT ldq, const float * rho, float * dlamda, const float * q2, FINT indx, FINT ctot, float * w, float * s, FINT lds, FINT2 info);
void f77_slaed4(FINT n, FINT i, const float * d, const float * z, float * delta, const float * rho, float * dlam, FINT2 info);
void f77_slaed5(FINT i, const float * d, const float * z, float * delta, const float * rho, float * dlam);
void f77_slaed6(FINT kniter, FLOG orgati, const float * rho, const float * d, const float * z, const float * finit, float * tau, FINT2 info);
void f77_slaed7(FINT icompq, FINT n, FINT qsiz, FINT tlvls, FINT curlvl, FINT curpbm, float * d, float * q, FINT ldq, FINT2 indxq, const float * rho, FINT cutpnt, float * qstore, FINT2 qptr, FINT prmptr, FINT perm, FINT givptr, FINT givcol, const float * givnum, float * work, FINT2 iwork, FINT2 info);
void f77_slaed8(FINT icompq, FINT2 k, FINT n, FINT qsiz, float * d, float * q, FINT ldq, FINT indxq, float * rho, FINT cutpnt, const float * z, float * dlamda, float * q2, FINT ldq2, float * w, FINT2 perm, FINT2 givptr, FINT2 givcol, float * givnum, FINT2 indxp, FINT2 indx, FINT2 info);
void f77_slaed9(FINT k, FINT kstart, FINT kstop, FINT n, float * d, float * q, FINT ldq, const float * rho, const float * dlamda, const float * w, float * s, FINT lds, FINT2 info);
void f77_slaeda(FINT n, FINT tlvls, FINT curlvl, FINT curpbm, FINT prmptr, FINT perm, FINT givptr, FINT givcol, const float * givnum, const float * q, FINT qptr, float * z, float * ztemp, FINT2 info);
void f77_slaein(FLOG rightv, FLOG noinit, FINT n, const float * h, FINT ldh, const float * wr, const float * wi, float * vr, float * vi, float * b, FINT ldb, float * work, const float * eps3, const float * smlnum, const float * bignum, FINT2 info);
void f77_slaev2(const float * a, const float * b, const float * c, float * rt1, float * rt2, float * cs1, float * sn1);
void f77_slaexc(FLOG wantq, FINT n, float * t, FINT ldt, float * q, FINT ldq, FINT j1, FINT n1, FINT n2, float * work, FINT2 info);
void f77_slag2(const float * a, FINT lda, const float * b, FINT ldb, const float * safmin, float * scale1, float * scale2, float * wr1, float * wr2, float * wi);
void f77_slags2(FLOG upper, const float * a1, const float * a2, const float * a3, const float * b1, const float * b2, const float * b3, float * csu, float * snu, float * csv, float * snv, float * csq, float * snq);
void f77_slagtf(FINT n, float * a, const float * lambda, float * b, float * c, const float * tol, float * d, FINT in, FINT2 info);
void f77_slagtm(const FCHAR trans, FINT n, FINT nrhs, const float * alpha, const float * dl, const float * d, const float * du, const float * x, FINT ldx, const float * beta, float * b, FINT ldb);
void f77_slagts(FINT job, FINT n, const float * a, const float * b, const float * c, const float * d, FINT in, float * y, float * tol, FINT2 info);
void f77_slagv2(float * a, FINT lda, float * b, FINT ldb, float * alphar, float * alphai, float * beta, float * csl, float * snl, float * csr, float * snr);
void f77_slahqr(FLOG wantt, FLOG wantz, FINT n, FINT ilo, FINT ihi, float * h, FINT ldh, float * wr, float * wi, FINT iloz, FINT ihiz, float * z, FINT ldz, FINT2 info);
void f77_slahrd(FINT n, FINT k, FINT nb, float * a, FINT lda, float * tau, float * t, FINT ldt, float * y, FINT ldy);
void f77_slaic1(FINT job, FINT j, const float * x, const float * sest, const float * w, const float * gamma, float * sestpr, float * s, float * c);
void f77_slaln2(FLOG ltrans, FINT na, FINT nw, const float * smin, const float * ca, const float * a, FINT lda, const float * d1, const float * d2, const float * b, FINT ldb, const float * wr, const float * wi, float * x, FINT ldx, float * scale, float * xnorm, FINT2 info);
void f77_slals0(FINT icompq, FINT nl, FINT nr, FINT sqre, FINT nrhs, float * b, FINT ldb, float * bx, FINT ldbx, FINT perm, FINT givptr, FINT givcol, FINT ldgcol, const float * givnum, FINT ldgnum, const float * poles, const float * difl, const float * difr, const float * z, FINT k, const float * c, const float * s, float * work, FINT2 info);
void f77_slalsa(FINT icompq, FINT smlsiz, FINT n, FINT nrhs, float * b, FINT ldb, float * bx, FINT ldbx, const float * u, FINT ldu, const float * vt, FINT k, const float * difl, const float * difr, const float * z, const float * poles, FINT givptr, FINT givcol, FINT ldgcol, FINT perm, const float * givnum, const float * c, const float * s, float * work, FINT2 iwork, FINT2 info);
void f77_slalsd(const FCHAR uplo, FINT smlsiz, FINT n, FINT nrhs, float * d, float * e, float * b, FINT ldb, const float * rcond, FINT2 rank, float * work, FINT2 iwork, FINT2 info);
void slamchsub(float output, const FCHAR cmach);
void f77_slamc1(FINT2 beta, FINT2 t, FLOG2 rnd, FLOG2 ieee1);
void f77_slamc2(FINT2 beta, FINT2 t, FLOG2 rnd, float * eps, FINT2 emin, float * rmin, FINT2 emax, float * rmax);
void slamc3sub(float output, const float * a, const float * b);
void f77_slamc4(FINT2 emin, const float * start, FINT base);
void f77_slamc5(FINT beta, FINT p, FINT emin, FLOG ieee, FINT2 emax, float * rmax);
void f77_slamrg(FINT n1, FINT n2, const float * a, FINT strd1, FINT strd2, FINT2 index);
void slangbsub(float output, const FCHAR norm, FINT n, FINT kl, FINT ku, const float * ab, FINT ldab, float * work);
void slangesub(float output, const FCHAR norm, FINT m, FINT n, const float * a, FINT lda, float * work);
void slangtsub(float output, const FCHAR norm, FINT n, const float * dl, const float * d, const float * du);
void slanhssub(float output, const FCHAR norm, FINT n, const float * a, FINT lda, float * work);
void slansbsub(float output, const FCHAR norm, const FCHAR uplo, FINT n, FINT k, const float * ab, FINT ldab, float * work);
void slanspsub(float output, const FCHAR norm, const FCHAR uplo, FINT n, const float * ap, float * work);
void slanstsub(float output, const FCHAR norm, FINT n, const float * d, const float * e);
void slansysub(float output, const FCHAR norm, const FCHAR uplo, FINT n, const float * a, FINT lda, float * work);
void slantbsub(float output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT k, const float * ab, FINT ldab, float * work);
void slantpsub(float output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const float * ap, float * work);
void slantrsub(float output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT m, FINT n, const float * a, FINT lda, float * work);
void f77_slanv2(float * a, float * b, float * c, float * d, float * rt1r, float * rt1i, float * rt2r, float * rt2i, float * cs, float * sn);
void f77_slapll(FINT n, float * x, FINT incx, float * y, FINT incy, float * ssmin);
void f77_slapmt(FLOG forwrd, FINT m, FINT n, float * x, FINT ldx, FINT2 k);
void slapy2sub(float output, const float * x, const float * y);
void slapy3sub(float output, const float * x, const float * y, const float * z);
void f77_slaqgb(FINT m, FINT n, FINT kl, FINT ku, float * ab, FINT ldab, const float * r, const float * c, const float * rowcnd, const float * colcnd, const float * amax, FCHAR equed);
void f77_slaqge(FINT m, FINT n, float * a, FINT lda, const float * r, const float * c, const float * rowcnd, const float * colcnd, const float * amax, FCHAR equed);
void f77_slaqp2(FINT m, FINT n, FINT offset, float * a, FINT lda, FINT2 jpvt, float * tau, float * vn1, float * vn2, float * work);
void f77_slaqps(FINT m, FINT n, FINT offset, FINT nb, FINT2 kb, float * a, FINT lda, FINT2 jpvt, float * tau, float * vn1, float * vn2, float * auxv, float * f, FINT ldf);
void f77_slaqsb(const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_slaqsp(const FCHAR uplo, FINT n, float * ap, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_slaqsy(const FCHAR uplo, FINT n, float * a, FINT lda, const float * s, const float * scond, const float * amax, FCHAR equed);
void f77_slaqtr(FLOG ltran, FLOG lreal, FINT n, const float * t, FINT ldt, const float * b, const float * w, float * scale, float * x, float * work, FINT2 info);
void f77_slar1v(FINT n, FINT b1, FINT bn, const float * sigma, const float * l, const float * d, const float * ld, const float * lld, const float * gersch, float * z, float * ztz, float * mingma, FINT2 r, FINT2 isuppz, float * work);
void f77_slar2v(FINT n, float * x, float * y, float * z, FINT incx, const float * c, const float * s, FINT incc);
void f77_slarf(const FCHAR side, FINT m, FINT n, const float * v, FINT incv, const float * tau, float * c, FINT ldc, float * work);
void f77_slarfb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, const float * v, FINT ldv, const float * t, FINT ldt, float * c, FINT ldc, float * work, FINT ldwork);
void f77_slarfg(FINT n, float * alpha, float * x, FINT incx, float * tau);
void f77_slarft(const FCHAR direct, const FCHAR storev, FINT n, FINT k, float * v, FINT ldv, const float * tau, float * t, FINT ldt);
void f77_slarfx(const FCHAR side, FINT m, FINT n, const float * v, const float * tau, float * c, FINT ldc, float * work);
void f77_slargv(FINT n, float * x, FINT incx, float * y, FINT incy, float * c, FINT incc);
void f77_slarnv(FINT idist, FINT2 iseed, FINT n, float * x);
void f77_slarrb(FINT n, const float * d, const float * l, const float * ld, const float * lld, FINT ifirst, FINT ilast, const float * sigma, const float * reltol, float * w, float * wgap, float * werr, const float * work, FINT iwork, FINT2 info);
void f77_slarre(FINT n, float * d, float * e, const float * tol, FINT2 nsplit, FINT2 isplit, FINT2 m, float * w, float * woff, float * gersch, const float * work, FINT2 info);
void f77_slarrf(FINT n, const float * d, const float * l, const float * ld, const float * lld, FINT ifirst, FINT ilast, float * w, const float * sigma, float * dplus, float * lplus, double * work, FINT2 iwork, FINT2 info);
void f77_slarrv(FINT n, float * d, float * l, FINT isplit, FINT m, const float * w, FINT iblock, const float * gersch, const float * tol, float * z, FINT ldz, FINT2 isuppz, float * work, FINT2 iwork, FINT2 info);
void f77_slartg(const float * f, const float * g, float * cs, float * sn, float * r);
void f77_slartv(FINT n, float * x, FINT incx, float * y, FINT incy, const float * c, const float * s, FINT incc);
void f77_slaruv(FINT2 iseed, FINT n, float * x);
void f77_slarz(const FCHAR side, FINT m, FINT n, FINT l, const float * v, FINT incv, const float * tau, float * c, FINT ldc, float * work);
void f77_slarzb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, FINT l, const float * v, FINT ldv, const float * t, FINT ldt, float * c, FINT ldc, float * work, FINT ldwork);
void f77_slarzt(const FCHAR direct, const FCHAR storev, FINT n, FINT k, float * v, FINT ldv, const float * tau, float * t, FINT ldt);
void f77_slas2(const float * f, const float * g, const float * h, float * ssmin, float * ssmax);
void f77_slascl(const FCHAR type, FINT kl, FINT ku, const float * cfrom, const float * cto, FINT m, FINT n, float * a, FINT lda, FINT2 info);
void f77_slasd0(FINT n, FINT sqre, float * d, const float * e, float * u, FINT ldu, float * vt, FINT ldvt, FINT smlsiz, FINT2 iwork, float * work, FINT2 info);
void f77_slasd1(FINT nl, FINT nr, FINT sqre, float * d, float * alpha, float * beta, float * u, FINT ldu, float * vt, FINT ldvt, FINT2 idxq, FINT2 iwork, float * work, FINT2 info);
void f77_slasd2(FINT nl, FINT nr, FINT sqre, FINT2 k, float * d, float * z, const float * alpha, const float * beta, float * u, FINT ldu, float * vt, FINT ldvt, float * dsigma, float * u2, FINT ldu2, float * vt2, FINT ldvt2, FINT2 idxp, FINT2 idx, FINT2 idxc, FINT2 idxq, FINT2 coltyp, FINT2 info);
void f77_slasd3(FINT nl, FINT nr, FINT sqre, FINT k, float * d, float * q, FINT ldq, float * dsigma, float * u, FINT ldu, const float * u2, FINT ldu2, float * vt, FINT ldvt, float * vt2, FINT ldvt2, FINT idxc, FINT ctot, float * z, FINT2 info);
void f77_slasd4(FINT n, FINT i, const float * d, const float * z, float * delta, const float * rho, float * sigma, float * work, FINT2 info);
void f77_slasd5(FINT i, const float * d, const float * z, float * delta, const float * rho, float * dsigma, float * work);
void f77_slasd6(FINT icompq, FINT nl, FINT nr, FINT sqre, float * d, float * vf, float * vl, float * alpha, float * beta, FINT2 idxq, FINT2 perm, FINT2 givptr, FINT2 givcol, FINT ldgcol, float * givnum, FINT ldgnum, float * poles, float * difl, float * difr, float * z, FINT2 k, float * c, float * s, float * work, FINT2 iwork, FINT2 info);
void f77_slasd7(FINT icompq, FINT nl, FINT nr, FINT sqre, FINT2 k, float * d, float * z, float * zw, float * vf, float * vfw, float * vl, float * vlw, const float * alpha, const float * beta, float * dsigma, FINT2 idx, FINT2 idxp, FINT idxq, FINT2 perm, FINT2 givptr, FINT2 givcol, FINT ldgcol, float * givnum, FINT ldgnum, float * c, float * s, FINT2 info);
void f77_slasd8(FINT icompq, FINT k, float * d, const float * z, float * vf, float * vl, float * difl, float * difr, FINT lddifr, const float * dsigma, float * work, FINT2 info);
void f77_slasda(FINT icompq, FINT smlsiz, FINT n, FINT sqre, float * d, const float * e, float * u, FINT ldu, float * vt, FINT2 k, float * difl, float * difr, float * z, float * poles, FINT2 givptr, FINT2 givcol, FINT ldgcol, FINT2 perm, float * givnum, float * c, float * s, float * work, FINT2 iwork, FINT2 info);
void f77_slasdq(const FCHAR uplo, FINT sqre, FINT n, FINT ncvt, FINT nru, FINT ncc, float * d, float * e, float * vt, FINT ldvt, float * u, FINT ldu, float * c, FINT ldc, float * work, FINT2 info);
void f77_slasdt(FINT n, FINT2 lvl, FINT2 nd, FINT2 inode, FINT2 ndiml, FINT2 ndimr, FINT msub);
void f77_slaset(const FCHAR uplo, FINT m, FINT n, const float * alpha, const float * beta, float * a, FINT lda);
void f77_slasq1(FINT n, float * d, float * e, float * work, FINT2 info);
void f77_slasq2(FINT n, float * z, FINT2 info);
void f77_slasq3(FINT i0, FINT n0, const float * z, FINT pp, float * dmin, float * sigma, float * desig, const float * qmax, FINT2 nfail, FINT2 iter, FINT2 ndiv, FINT2 ttype, FLOG ieee);
void f77_slasq4(FINT i0, FINT n0, const float * z, FINT pp, FINT n0in, const float * dmin, const float * dmin1, const float * dmin2, const float * dn, const float * dn1, const float * dn2, float * tau, FINT2 ttype);
void f77_slasq5(FINT i0, FINT n0, const float * z, FINT pp, const float * tau, float * dmin, float * dmin1, float * dmin2, float * dn, float * dnm1, float * dnm2, FLOG ieee);
void f77_slasq6(FINT i0, FINT n0, const float * z, FINT pp, float * dmin, float * dmin1, float * dmin2, float * dn, float * dnm1, float * dnm2);
void f77_slasr(const FCHAR side, const FCHAR pivot, const FCHAR direct, FINT m, FINT n, const float * c, const float * s, float * a, FINT lda);
void f77_slasrt(const FCHAR id, FINT n, float * d, FINT2 info);
void f77_slassq(FINT n, const float * x, FINT incx, float * scale, float * sumsq);
void f77_slasv2(const float * f, const float * g, const float * h, float * ssmin, float * ssmax, float * snl, float * csl, float * snr, float * csr);
void f77_slaswp(FINT n, float * a, FINT lda, FINT k1, FINT k2, FINT ipiv, FINT incx);
void f77_slasy2(FLOG ltranl, FLOG ltranr, FINT isgn, FINT n1, FINT n2, const float * tl, FINT ldtl, const float * tr, FINT ldtr, const float * b, FINT ldb, float * scale, float * x, FINT ldx, float * xnorm, FINT2 info);
void f77_slasyf(const FCHAR uplo, FINT n, FINT nb, FINT2 kb, float * a, FINT lda, FINT2 ipiv, float * w, FINT ldw, FINT2 info);
void f77_slatbs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, FINT kd, const float * ab, FINT ldab, float * x, float * scale, float * cnorm, FINT2 info);
void f77_slatdf(FINT ijob, FINT n, const float * z, FINT ldz, float * rhs, float * rdsum, float * rdscal, FINT ipiv, FINT jpiv);
void f77_slatps(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const float * ap, float * x, float * scale, float * cnorm, FINT2 info);
void f77_slatrd(const FCHAR uplo, FINT n, FINT nb, float * a, FINT lda, float * e, float * tau, float * w, FINT ldw);
void f77_slatrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const float * a, FINT lda, float * x, float * scale, float * cnorm, FINT2 info);
void f77_slatrz(FINT m, FINT n, FINT l, float * a, FINT lda, float * tau, float * work);
void f77_slatzm(const FCHAR side, FINT m, FINT n, const float * v, FINT incv, const float * tau, float * c1, float * c2, FINT ldc, float * work);
void f77_slauu2(const FCHAR uplo, FINT n, float * a, FINT lda, FINT2 info);
void f77_slauum(const FCHAR uplo, FINT n, float * a, FINT lda, FINT2 info);
void f77_slazq3(FINT i0, FINT n0, const float * z, FINT pp, float * dmin, float * sigma, float * desig, const float * qmax, FINT2 nfail, FINT2 iter, FINT2 ndiv, FLOG ieee, FINT2 ttype, float * dmin1, float * dmin2, float * dn, float * dn1, float * dn2, float * tau);
void f77_slazq4(FINT i0, FINT n0, const float * z, FINT pp, FINT n0in, const float * dmin, const float * dmin1, const float * dmin2, const float * dn, const float * dn1, const float * dn2, float * tau, FINT2 ttype, float * g);
void f77_sopgtr(const FCHAR uplo, FINT n, const float * ap, const float * tau, float * q, FINT ldq, float * work, FINT2 info);
void f77_sopmtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const float * ap, const float * tau, float * c, FINT ldc, float * work, FINT2 info);
void f77_sorg2l(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT2 info);
void f77_sorg2r(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT2 info);
void f77_sorgbr(const FCHAR vect, FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT lwork, FINT2 info);
void f77_sorghr(FINT n, FINT ilo, FINT ihi, float * a, FINT lda, const float * tau, float * work, FINT lwork, FINT2 info);
void f77_sorgl2(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT2 info);
void f77_sorglq(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT lwork, FINT2 info);
void f77_sorgql(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT lwork, FINT2 info);
void f77_sorgqr(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT lwork, FINT2 info);
void f77_sorgr2(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT2 info);
void f77_sorgrq(FINT m, FINT n, FINT k, float * a, FINT lda, const float * tau, float * work, FINT lwork, FINT2 info);
void f77_sorgtr(const FCHAR uplo, FINT n, float * a, FINT lda, const float * tau, float * work, FINT lwork, FINT2 info);
void f77_sorm2l(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT2 info);
void f77_sorm2r(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT2 info);
void f77_sormbr(const FCHAR vect, const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_sormhr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT ilo, FINT ihi, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_sorml2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT2 info);
void f77_sormlq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_sormql(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_sormqr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_sormr2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT2 info);
void f77_sormr3(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT2 info);
void f77_sormrq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_sormrz(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_sormtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const float * a, FINT lda, const float * tau, float * c, FINT ldc, float * work, FINT lwork, FINT2 info);
void f77_spbcon(const FCHAR uplo, FINT n, FINT kd, const float * ab, FINT ldab, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_spbequ(const FCHAR uplo, FINT n, FINT kd, const float * ab, FINT ldab, float * s, float * scond, float * amax, FINT2 info);
void f77_spbrfs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const float * ab, FINT ldab, const float * afb, FINT ldafb, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_spbstf(const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, FINT2 info);
void f77_spbsv(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, float * ab, FINT ldab, float * b, FINT ldb, FINT2 info);
void f77_spbsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT kd, FINT nrhs, float * ab, FINT ldab, float * afb, FINT ldafb, FCHAR equed, float * s, float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_spbtf2(const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, FINT2 info);
void f77_spbtrf(const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, FINT2 info);
void f77_spbtrs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const float * ab, FINT ldab, float * b, FINT ldb, FINT2 info);
void f77_spocon(const FCHAR uplo, FINT n, const float * a, FINT lda, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_spoequ(FINT n, const float * a, FINT lda, float * s, float * scond, float * amax, FINT2 info);
void f77_sporfs(const FCHAR uplo, FINT n, FINT nrhs, const float * a, FINT lda, const float * af, FINT ldaf, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sposv(const FCHAR uplo, FINT n, FINT nrhs, float * a, FINT lda, float * b, FINT ldb, FINT2 info);
void f77_sposvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, float * a, FINT lda, float * af, FINT ldaf, FCHAR equed, float * s, float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_spotf2(const FCHAR uplo, FINT n, float * a, FINT lda, FINT2 info);
void f77_spotrf(const FCHAR uplo, FINT n, float * a, FINT lda, FINT2 info);
void f77_spotri(const FCHAR uplo, FINT n, float * a, FINT lda, FINT2 info);
void f77_spotrs(const FCHAR uplo, FINT n, FINT nrhs, const float * a, FINT lda, float * b, FINT ldb, FINT2 info);
void f77_sppcon(const FCHAR uplo, FINT n, const float * ap, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_sppequ(const FCHAR uplo, FINT n, const float * ap, float * s, float * scond, float * amax, FINT2 info);
void f77_spprfs(const FCHAR uplo, FINT n, FINT nrhs, const float * ap, const float * afp, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sppsv(const FCHAR uplo, FINT n, FINT nrhs, float * ap, float * b, FINT ldb, FINT2 info);
void f77_sppsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, float * ap, float * afp, FCHAR equed, float * s, float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_spptrf(const FCHAR uplo, FINT n, float * ap, FINT2 info);
void f77_spptri(const FCHAR uplo, FINT n, float * ap, FINT2 info);
void f77_spptrs(const FCHAR uplo, FINT n, FINT nrhs, const float * ap, float * b, FINT ldb, FINT2 info);
void f77_sptcon(FINT n, const float * d, const float * e, const float * anorm, float * rcond, float * work, FINT2 info);
void f77_spteqr(const FCHAR compz, FINT n, float * d, float * e, float * z, FINT ldz, float * work, FINT2 info);
void f77_sptrfs(FINT n, FINT nrhs, const float * d, const float * e, const float * df, const float * ef, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 info);
void f77_sptsv(FINT n, FINT nrhs, float * d, float * e, float * b, FINT ldb, FINT2 info);
void f77_sptsvx(const FCHAR fact, FINT n, FINT nrhs, const float * d, const float * e, float * df, float * ef, const float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 info);
void f77_spttrf(FINT n, float * d, float * e, FINT2 info);
void f77_spttrs(FINT n, FINT nrhs, const float * d, const float * e, float * b, FINT ldb, FINT2 info);
void f77_sptts2(FINT n, FINT nrhs, const float * d, const float * e, float * b, FINT ldb);
void f77_srscl(FINT n, const float * sa, float * sx, FINT incx);
void f77_ssbev(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, float * w, float * z, FINT ldz, float * work, FINT2 info);
void f77_ssbevd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, float * w, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_ssbevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, float * q, FINT ldq, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, float * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_ssbgst(const FCHAR vect, const FCHAR uplo, FINT n, FINT ka, FINT kb, float * ab, FINT ldab, const float * bb, FINT ldbb, float * x, FINT ldx, float * work, FINT2 info);
void f77_ssbgv(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, float * ab, FINT ldab, float * bb, FINT ldbb, float * w, float * z, FINT ldz, float * work, FINT2 info);
void f77_ssbgvd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, float * ab, FINT ldab, float * bb, FINT ldbb, float * w, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_ssbgvx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT ka, FINT kb, float * ab, FINT ldab, float * bb, FINT ldbb, float * q, FINT ldq, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, float * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_ssbtrd(const FCHAR vect, const FCHAR uplo, FINT n, FINT kd, float * ab, FINT ldab, float * d, float * e, float * q, FINT ldq, float * work, FINT2 info);
void f77_sspcon(const FCHAR uplo, FINT n, const float * ap, FINT ipiv, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_sspev(const FCHAR jobz, const FCHAR uplo, FINT n, float * ap, float * w, float * z, FINT ldz, float * work, FINT2 info);
void f77_sspevd(const FCHAR jobz, const FCHAR uplo, FINT n, float * ap, float * w, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_sspevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, float * ap, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, float * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_sspgst(FINT itype, const FCHAR uplo, FINT n, float * ap, const float * bp, FINT2 info);
void f77_sspgv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, float * ap, float * bp, float * w, float * z, FINT ldz, float * work, FINT2 info);
void f77_sspgvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, float * ap, float * bp, float * w, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_sspgvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, float * ap, float * bp, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, float * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_ssprfs(const FCHAR uplo, FINT n, FINT nrhs, const float * ap, const float * afp, FINT ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_sspsv(const FCHAR uplo, FINT n, FINT nrhs, float * ap, FINT2 ipiv, float * b, FINT ldb, FINT2 info);
void f77_sspsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const float * ap, float * afp, FINT2 ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_ssptrd(const FCHAR uplo, FINT n, float * ap, float * d, float * e, float * tau, FINT2 info);
void f77_ssptrf(const FCHAR uplo, FINT n, float * ap, FINT2 ipiv, FINT2 info);
void f77_ssptri(const FCHAR uplo, FINT n, float * ap, FINT ipiv, float * work, FINT2 info);
void f77_ssptrs(const FCHAR uplo, FINT n, FINT nrhs, const float * ap, FINT ipiv, float * b, FINT ldb, FINT2 info);
void f77_sstebz(const FCHAR range, const FCHAR order, FINT n, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, const float * d, const float * e, FINT2 m, FINT2 nsplit, float * w, FINT2 iblock, FINT2 isplit, float * work, FINT2 iwork, FINT2 info);
void f77_sstedc(const FCHAR compz, FINT n, float * d, float * e, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_sstegr(const FCHAR jobz, const FCHAR range, FINT n, float * d, float * e, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, FINT2 isuppz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_sstein(FINT n, const float * d, const float * e, FINT m, const float * w, FINT iblock, FINT isplit, float * z, FINT ldz, float * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_ssteqr(const FCHAR compz, FINT n, float * d, float * e, float * z, FINT ldz, float * work, FINT2 info);
void f77_ssterf(FINT n, float * d, float * e, FINT2 info);
void f77_sstev(const FCHAR jobz, FINT n, float * d, float * e, float * z, FINT ldz, float * work, FINT2 info);
void f77_sstevd(const FCHAR jobz, FINT n, float * d, float * e, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_sstevr(const FCHAR jobz, const FCHAR range, FINT n, float * d, float * e, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, FINT2 isuppz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_sstevx(const FCHAR jobz, const FCHAR range, FINT n, float * d, float * e, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, float * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_ssycon(const FCHAR uplo, FINT n, const float * a, FINT lda, FINT ipiv, const float * anorm, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_ssyev(const FCHAR jobz, const FCHAR uplo, FINT n, float * a, FINT lda, float * w, float * work, FINT lwork, FINT2 info);
void f77_ssyevd(const FCHAR jobz, const FCHAR uplo, FINT n, float * a, FINT lda, float * w, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_ssyevr(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, float * a, FINT lda, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, FINT2 isuppz, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_ssyevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, float * a, FINT lda, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_ssygs2(FINT itype, const FCHAR uplo, FINT n, float * a, FINT lda, const float * b, FINT ldb, FINT2 info);
void f77_ssygst(FINT itype, const FCHAR uplo, FINT n, float * a, FINT lda, const float * b, FINT ldb, FINT2 info);
void f77_ssygv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, float * a, FINT lda, float * b, FINT ldb, float * w, float * work, FINT lwork, FINT2 info);
void f77_ssygvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, float * a, FINT lda, float * b, FINT ldb, float * w, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_ssygvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, float * a, FINT lda, float * b, FINT ldb, const float * vl, const float * vu, FINT il, FINT iu, const float * abstol, FINT2 m, float * w, float * z, FINT ldz, float * work, FINT lwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_ssyrfs(const FCHAR uplo, FINT n, FINT nrhs, const float * a, FINT lda, const float * af, FINT ldaf, FINT ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_ssysv(const FCHAR uplo, FINT n, FINT nrhs, float * a, FINT lda, FINT2 ipiv, float * b, FINT ldb, float * work, FINT lwork, FINT2 info);
void f77_ssysvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const float * a, FINT lda, float * af, FINT ldaf, FINT2 ipiv, const float * b, FINT ldb, float * x, FINT ldx, float * rcond, float * ferr, float * berr, float * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_ssytd2(const FCHAR uplo, FINT n, float * a, FINT lda, float * d, float * e, float * tau, FINT2 info);
void f77_ssytf2(const FCHAR uplo, FINT n, float * a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_ssytrd(const FCHAR uplo, FINT n, float * a, FINT lda, float * d, float * e, float * tau, float * work, FINT lwork, FINT2 info);
void f77_ssytrf(const FCHAR uplo, FINT n, float * a, FINT lda, FINT2 ipiv, float * work, FINT lwork, FINT2 info);
void f77_ssytri(const FCHAR uplo, FINT n, float * a, FINT lda, FINT ipiv, float * work, FINT2 info);
void f77_ssytrs(const FCHAR uplo, FINT n, FINT nrhs, const float * a, FINT lda, FINT ipiv, float * b, FINT ldb, FINT2 info);
void f77_stbcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT kd, const float * ab, FINT ldab, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_stbrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const float * ab, FINT ldab, const float * b, FINT ldb, const float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_stbtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const float * ab, FINT ldab, float * b, FINT ldb, FINT2 info);
void f77_stgevc(const FCHAR side, const FCHAR howmny, FLOG select, FINT n, const float * s, FINT lds, const float * p, FINT ldp, float * vl, FINT ldvl, float * vr, FINT ldvr, FINT mm, FINT2 m, float * work, FINT2 info);
void f77_stgex2(FLOG wantq, FLOG wantz, FINT n, float * a, FINT lda, float * b, FINT ldb, float * q, FINT ldq, float * z, FINT ldz, FINT j1, FINT n1, FINT n2, float * work, FINT lwork, FINT2 info);
void f77_stgexc(FLOG wantq, FLOG wantz, FINT n, float * a, FINT lda, float * b, FINT ldb, float * q, FINT ldq, float * z, FINT ldz, FINT2 ifst, FINT2 ilst, float * work, FINT lwork, FINT2 info);
void f77_stgsen(FINT ijob, FLOG wantq, FLOG wantz, FLOG select, FINT n, float * a, FINT lda, float * b, FINT ldb, float * alphar, float * alphai, float * beta, float * q, FINT ldq, float * z, FINT ldz, FINT2 m, float * pl, float * pr, float * dif, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_stgsja(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, FINT k, FINT l, float * a, FINT lda, float * b, FINT ldb, const float * tola, const float * tolb, float * alpha, float * beta, float * u, FINT ldu, float * v, FINT ldv, float * q, FINT ldq, float * work, FINT2 ncycle, FINT2 info);
void f77_stgsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const float * a, FINT lda, const float * b, FINT ldb, const float * vl, FINT ldvl, const float * vr, FINT ldvr, float * s, float * dif, FINT mm, FINT2 m, float * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_stgsy2(const FCHAR trans, FINT ijob, FINT m, FINT n, const float * a, FINT lda, const float * b, FINT ldb, float * c, FINT ldc, const float * d, FINT ldd, const float * e, FINT lde, float * f, FINT ldf, float * scale, float * rdsum, float * rdscal, FINT2 iwork, FINT2 pq, FINT2 info);
void f77_stgsyl(const FCHAR trans, FINT ijob, FINT m, FINT n, const float * a, FINT lda, const float * b, FINT ldb, float * c, FINT ldc, const float * d, FINT ldd, const float * e, FINT lde, float * f, FINT ldf, float * dif, float * scale, float * work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_stpcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const float * ap, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_stprfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const float * ap, const float * b, FINT ldb, const float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_stptri(const FCHAR uplo, const FCHAR diag, FINT n, float * ap, FINT2 info);
void f77_stptrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const float * ap, float * b, FINT ldb, FINT2 info);
void f77_strcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const float * a, FINT lda, float * rcond, float * work, FINT2 iwork, FINT2 info);
void f77_strevc(const FCHAR side, const FCHAR howmny, FLOG2 select, FINT n, const float * t, FINT ldt, float * vl, FINT ldvl, float * vr, FINT ldvr, FINT mm, FINT2 m, float * work, FINT2 info);
void f77_strexc(const FCHAR compq, FINT n, float * t, FINT ldt, float * q, FINT ldq, FINT2 ifst, FINT2 ilst, float * work, FINT2 info);
void f77_strrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const float * a, FINT lda, const float * b, FINT ldb, const float * x, FINT ldx, float * ferr, float * berr, float * work, FINT2 iwork, FINT2 info);
void f77_strsen(const FCHAR job, const FCHAR compq, FLOG select, FINT n, float * t, FINT ldt, float * q, FINT ldq, float * wr, float * wi, FINT2 m, float * s, float * sep, float * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_strsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const float * t, FINT ldt, const float * vl, FINT ldvl, const float * vr, FINT ldvr, float * s, float * sep, FINT mm, FINT2 m, float * work, FINT ldwork, FINT2 iwork, FINT2 info);
void f77_strsyl(const FCHAR trana, const FCHAR tranb, FINT isgn, FINT m, FINT n, const float * a, FINT lda, const float * b, FINT ldb, float * c, FINT ldc, float * scale, FINT2 info);
void f77_strti2(const FCHAR uplo, const FCHAR diag, FINT n, float * a, FINT lda, FINT2 info);
void f77_strtri(const FCHAR uplo, const FCHAR diag, FINT n, float * a, FINT lda, FINT2 info);
void f77_strtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const float * a, FINT lda, float * b, FINT ldb, FINT2 info);
void f77_stzrqf(FINT m, FINT n, float * a, FINT lda, float * tau, FINT2 info);
void f77_stzrzf(FINT m, FINT n, float * a, FINT lda, float * tau, float * work, FINT lwork, FINT2 info);
void f77_xerbla(const FCHAR srname, FINT info);
void f77_zbdsqr(const FCHAR uplo, FINT n, FINT ncvt, FINT nru, FINT ncc, double * d, double * e, void *vt, FINT ldvt, void *u, FINT ldu, void *c, FINT ldc, double * rwork, FINT2 info);
void f77_zdrot(FINT n, const void *cx, FINT incx, const void *cy, FINT incy, const double * c, const double * s);
void f77_zdrscl(FINT n, const double * sa, void *sx, FINT incx);
void f77_zgbbrd(const FCHAR vect, FINT m, FINT n, FINT ncc, FINT kl, FINT ku, void *ab, FINT ldab, double * d, double * e, void *q, FINT ldq, void *pt, FINT ldpt, void *c, FINT ldc, void *work, double * rwork, FINT2 info);
void f77_zgbcon(const FCHAR norm, FINT n, FINT kl, FINT ku, const void *ab, FINT ldab, FINT ipiv, const double * anorm, double * rcond, void *work, double * rwork, FINT2 info);
void f77_zgbequ(FINT m, FINT n, FINT kl, FINT ku, const void *ab, FINT ldab, double * r, double * c, double * rowcnd, double * colcnd, double * amax, FINT2 info);
void f77_zgbrfs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const void *ab, FINT ldab, const void *afb, FINT ldafb, FINT ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zgbsv(FINT n, FINT kl, FINT ku, FINT nrhs, void *ab, FINT ldab, FINT2 ipiv, void *b, FINT ldb, FINT2 info);
void f77_zgbsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, void *ab, FINT ldab, void *afb, FINT ldafb, FINT2 ipiv, FCHAR equed, double * r, double * c, void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zgbtf2(FINT m, FINT n, FINT kl, FINT ku, void *ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_zgbtrf(FINT m, FINT n, FINT kl, FINT ku, void *ab, FINT ldab, FINT2 ipiv, FINT2 info);
void f77_zgbtrs(const FCHAR trans, FINT n, FINT kl, FINT ku, FINT nrhs, const void *ab, FINT ldab, FINT ipiv, void *b, FINT ldb, FINT2 info);
void f77_zgebak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const double * scale, FINT m, void *v, FINT ldv, FINT2 info);
void f77_zgebal(const FCHAR job, FINT n, void *a, FINT lda, FINT2 ilo, FINT2 ihi, double * scale, FINT2 info);
void f77_zgebd2(FINT m, FINT n, void *a, FINT lda, double * d, double * e, void *tauq, void *taup, void *work, FINT2 info);
void f77_zgebrd(FINT m, FINT n, void *a, FINT lda, double * d, double * e, void *tauq, void *taup, void *work, FINT lwork, FINT2 info);
void f77_zgecon(const FCHAR norm, FINT n, const void *a, FINT lda, const double * anorm, double * rcond, void *work, double * rwork, FINT2 info);
void f77_zgeequ(FINT m, FINT n, const void *a, FINT lda, double * r, double * c, double * rowcnd, double * colcnd, double * amax, FINT2 info);
void f77_zgees(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (void*), FINT n, void *a, FINT lda, FINT2 sdim, void *w, void *vs, FINT ldvs, void *work, FINT lwork, double * rwork, long int * bwork, FINT2 info);
void f77_zgeesx(const FCHAR jobvs, const FCHAR sort,  const long int (*select) (void*), const FCHAR sense, FINT n, void *a, FINT lda, FINT2 sdim, void *w, void *vs, FINT ldvs, double * rconde, double * rcondv, void *work, FINT lwork, double * rwork, long int * bwork, FINT2 info);
void f77_zgeev(const FCHAR jobvl, const FCHAR jobvr, FINT n, void *a, FINT lda, void *w, void *vl, FINT ldvl, void *vr, FINT ldvr, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgeevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, void *a, FINT lda, void *w, void *vl, FINT ldvl, void *vr, FINT ldvr, FINT2 ilo, FINT2 ihi, double * scale, double * abnrm, double * rconde, double * rcondv, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgegs(const FCHAR jobvsl, const FCHAR jobvsr, FINT n, void *a, FINT lda, void *b, FINT ldb, void *alpha, void *beta, void *vsl, FINT ldvsl, void *vsr, FINT ldvsr, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgegv(const FCHAR jobvl, const FCHAR jobvr, FINT n, void *a, FINT lda, void *b, FINT ldb, void *alpha, void *beta, void *vl, FINT ldvl, void *vr, FINT ldvr, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgehd2(FINT n, FINT ilo, FINT ihi, void *a, FINT lda, void *tau, void *work, FINT2 info);
void f77_zgehrd(FINT n, FINT ilo, FINT ihi, void *a, FINT lda, void *tau, void *work, FINT lwork, FINT2 info);
void f77_zgelq2(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT2 info);
void f77_zgelqf(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT lwork, FINT2 info);
void f77_zgels(const FCHAR trans, FINT m, FINT n, FINT nrhs, void *a, FINT lda, void *b, FINT ldb, void *work, FINT lwork, FINT2 info);
void f77_zgelsd(FINT m, FINT n, FINT nrhs, const void *a, FINT lda, void *b, FINT ldb, double * s, const double * rcond, FINT2 rank, void *work, FINT lwork, double * rwork, FINT2 iwork, FINT2 info);
void f77_zgelss(FINT m, FINT n, FINT nrhs, void *a, FINT lda, void *b, FINT ldb, double * s, const double * rcond, FINT2 rank, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgelsx(FINT m, FINT n, FINT nrhs, void *a, FINT lda, void *b, FINT ldb, FINT2 jpvt, const double * rcond, FINT2 rank, void *work, double * rwork, FINT2 info);
void f77_zgelsy(FINT m, FINT n, FINT nrhs, void *a, FINT lda, void *b, FINT ldb, FINT2 jpvt, const double * rcond, FINT2 rank, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgeql2(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT2 info);
void f77_zgeqlf(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT lwork, FINT2 info);
void f77_zgeqp3(FINT m, FINT n, void *a, FINT lda, FINT2 jpvt, void *tau, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgeqpf(FINT m, FINT n, void *a, FINT lda, FINT2 jpvt, void *tau, void *work, double * rwork, FINT2 info);
void f77_zgeqr2(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT2 info);
void f77_zgeqrf(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT lwork, FINT2 info);
void f77_zgerfs(const FCHAR trans, FINT n, FINT nrhs, const void *a, FINT lda, const void *af, FINT ldaf, FINT ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zgerq2(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT2 info);
void f77_zgerqf(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT lwork, FINT2 info);
void f77_zgesc2(FINT n, const void *a, FINT lda, void *rhs, FINT ipiv, FINT jpiv, double * scale);
void f77_zgesdd(const FCHAR jobz, FINT m, FINT n, void *a, FINT lda, double * s, void *u, FINT ldu, void *vt, FINT ldvt, void *work, FINT lwork, double * rwork, FINT2 iwork, FINT2 info);
void f77_zgesv(FINT n, FINT nrhs, void *a, FINT lda, FINT2 ipiv, void *b, FINT ldb, FINT2 info);
void f77_zgesvd(const FCHAR jobu, const FCHAR jobvt, FINT m, FINT n, void *a, FINT lda, double * s, void *u, FINT ldu, void *vt, FINT ldvt, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zgesvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, void *a, FINT lda, void *af, FINT ldaf, FINT2 ipiv, FCHAR equed, double * r, double * c, void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zgetc2(FINT n, void *a, FINT lda, FINT2 ipiv, FINT2 jpiv, FINT2 info);
void f77_zgetf2(FINT m, FINT n, void *a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_zgetrf(FINT m, FINT n, void *a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_zgetri(FINT n, void *a, FINT lda, FINT ipiv, void *work, FINT lwork, FINT2 info);
void f77_zgetrs(const FCHAR trans, FINT n, FINT nrhs, const void *a, FINT lda, FINT ipiv, void *b, FINT ldb, FINT2 info);
void f77_zggbak(const FCHAR job, const FCHAR side, FINT n, FINT ilo, FINT ihi, const double * lscale, const double * rscale, FINT m, void *v, FINT ldv, FINT2 info);
void f77_zggbal(const FCHAR job, FINT n, void *a, FINT lda, void *b, FINT ldb, FINT2 ilo, FINT2 ihi, double * lscale, double * rscale, float * work, FINT2 info);
void f77_zgges(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (void*,void*), FINT n, void *a, FINT lda, void *b, FINT ldb, FINT2 sdim, void *alpha, void *beta, void *vsl, FINT ldvsl, void *vsr, FINT ldvsr, void *work, FINT lwork, double * rwork, long int * bwork, FINT2 info);
void f77_zggesx(const FCHAR jobvsl, const FCHAR jobvsr, const FCHAR sort,  const long int (*selctg) (void*,void*), const FCHAR sense, FINT n, void *a, FINT lda, void *b, FINT ldb, FINT2 sdim, void *alpha, void *beta, void *vsl, FINT ldvsl, void *vsr, FINT ldvsr, double * rconde, double * rcondv, void *work, FINT lwork, double * rwork, FINT2 iwork, FINT liwork, long int * bwork, FINT2 info);
void f77_zggev(const FCHAR jobvl, const FCHAR jobvr, FINT n, void *a, FINT lda, void *b, FINT ldb, void *alpha, void *beta, void *vl, FINT ldvl, void *vr, FINT ldvr, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zggevx(const FCHAR balanc, const FCHAR jobvl, const FCHAR jobvr, const FCHAR sense, FINT n, void *a, FINT lda, void *b, FINT ldb, void *alpha, void *beta, void *vl, FINT ldvl, void *vr, FINT ldvr, FINT2 ilo, FINT2 ihi, double * lscale, double * rscale, double * abnrm, double * bbnrm, double * rconde, double * rcondv, void *work, FINT lwork, float * rwork, FINT2 iwork, long int * bwork, FINT2 info);
void f77_zggglm(FINT n, FINT m, FINT p, void *a, FINT lda, void *b, FINT ldb, void *d, void *x, void *y, void *work, FINT lwork, FINT2 info);
void f77_zgghrd(const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, void *a, FINT lda, void *b, FINT ldb, void *q, FINT ldq, void *z, FINT ldz, FINT2 info);
void f77_zgglse(FINT m, FINT n, FINT p, void *a, FINT lda, void *b, FINT ldb, void *c, void *d, void *x, void *work, FINT lwork, FINT2 info);
void f77_zggqrf(FINT n, FINT m, FINT p, void *a, FINT lda, void *taua, void *b, FINT ldb, void *taub, void *work, FINT lwork, FINT2 info);
void f77_zggrqf(FINT m, FINT p, FINT n, void *a, FINT lda, void *taua, void *b, FINT ldb, void *taub, void *work, FINT lwork, FINT2 info);
void f77_zggsvd(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT n, FINT p, FINT2 k, FINT2 l, void *a, FINT lda, void *b, FINT ldb, double * alpha, double * beta, void *u, FINT ldu, void *v, FINT ldv, void *q, FINT ldq, void *work, double * rwork, FINT2 iwork, FINT2 info);
void f77_zggsvp(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, void *a, FINT lda, void *b, FINT ldb, const double * tola, const double * tolb, FINT2 k, FINT2 l, void *u, FINT ldu, void *v, FINT ldv, void *q, FINT ldq, FINT2 iwork, double * rwork, void *tau, void *work, FINT2 info);
void f77_zgtcon(const FCHAR norm, FINT n, const void *dl, const void *d, const void *du, const void *du2, FINT ipiv, const double * anorm, double * rcond, void *work, FINT2 info);
void f77_zgtrfs(const FCHAR trans, FINT n, FINT nrhs, const void *dl, const void *d, const void *du, const void *dlf, const void *df, const void *duf, const void *du2, FINT ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zgtsv(FINT n, FINT nrhs, void *dl, void *d, void *du, void *b, FINT ldb, FINT2 info);
void f77_zgtsvx(const FCHAR fact, const FCHAR trans, FINT n, FINT nrhs, const void *dl, const void *d, const void *du, void *dlf, void *df, void *duf, void *du2, FINT2 ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zgttrf(FINT n, void *dl, void *d, void *du, void *du2, FINT2 ipiv, FINT2 info);
void f77_zgttrs(const FCHAR trans, FINT n, FINT nrhs, const void *dl, const void *d, const void *du, const void *du2, FINT ipiv, void *b, FINT ldb, FINT2 info);
void f77_zgtts2(FINT itrans, FINT n, FINT nrhs, const void *dl, const void *d, const void *du, const void *du2, FINT ipiv, void *b, FINT ldb);
void f77_zhbev(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 info);
void f77_zhbevd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, double * w, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zhbevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, void *q, FINT ldq, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_zhbgst(const FCHAR vect, const FCHAR uplo, FINT n, FINT ka, FINT kb, void *ab, FINT ldab, const void *bb, FINT ldbb, void *x, FINT ldx, void *work, double * rwork, FINT2 info);
void f77_zhbgv(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, void *ab, FINT ldab, void *bb, FINT ldbb, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 info);
void f77_zhbgvd(const FCHAR jobz, const FCHAR uplo, FINT n, FINT ka, FINT kb, void *ab, FINT ldab, void *bb, FINT ldbb, double * w, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zhbgvx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, FINT ka, FINT kb, void *ab, FINT ldab, void *bb, FINT ldbb, void *q, FINT ldq, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_zhbtrd(const FCHAR vect, const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, double * d, double * e, void *q, FINT ldq, void *work, FINT2 info);
void f77_zhecon(const FCHAR uplo, FINT n, const void *a, FINT lda, FINT ipiv, const double * anorm, double * rcond, void *work, FINT2 info);
void f77_zheev(const FCHAR jobz, const FCHAR uplo, FINT n, void *a, FINT lda, double * w, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zheevd(const FCHAR jobz, const FCHAR uplo, FINT n, void *a, FINT lda, double * w, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zheevr(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void *a, FINT lda, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, FINT2 isuppz, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zheevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void *a, FINT lda, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_zhegs2(FINT itype, const FCHAR uplo, FINT n, void *a, FINT lda, const void *b, FINT ldb, FINT2 info);
void f77_zhegst(FINT itype, const FCHAR uplo, FINT n, void *a, FINT lda, const void *b, FINT ldb, FINT2 info);
void f77_zhegv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void *a, FINT lda, void *b, FINT ldb, double * w, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zhegvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void *a, FINT lda, void *b, FINT ldb, double * w, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zhegvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void *a, FINT lda, void *b, FINT ldb, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_zherfs(const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, const void *af, FINT ldaf, FINT ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zhesv(const FCHAR uplo, FINT n, FINT nrhs, void *a, FINT lda, FINT2 ipiv, void *b, FINT ldb, void *work, FINT lwork, FINT2 info);
void f77_zhesvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, void *af, FINT ldaf, FINT2 ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zhetd2(const FCHAR uplo, FINT n, void *a, FINT lda, double * d, double * e, void *tau, FINT2 info);
void f77_zhetf2(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_zhetrd(const FCHAR uplo, FINT n, void *a, FINT lda, double * d, double * e, void *tau, void *work, FINT lwork, FINT2 info);
void f77_zhetrf(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 ipiv, void *work, FINT lwork, FINT2 info);
void f77_zhetri(const FCHAR uplo, FINT n, void *a, FINT lda, FINT ipiv, void *work, FINT2 info);
void f77_zhetrs(const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, FINT ipiv, void *b, FINT ldb, FINT2 info);
void f77_zhgeqz(const FCHAR job, const FCHAR compq, const FCHAR compz, FINT n, FINT ilo, FINT ihi, void *h, FINT ldh, void *t, FINT ldt, void *alpha, void *beta, void *q, FINT ldq, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zhpcon(const FCHAR uplo, FINT n, const void *ap, FINT ipiv, const double * anorm, double * rcond, void *work, FINT2 info);
void f77_zhpev(const FCHAR jobz, const FCHAR uplo, FINT n, void *ap, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 info);
void f77_zhpevd(const FCHAR jobz, const FCHAR uplo, FINT n, void *ap, double * w, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zhpevx(const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void *ap, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_zhpgst(FINT itype, const FCHAR uplo, FINT n, void *ap, const void *bp, FINT2 info);
void f77_zhpgv(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void *ap, void *bp, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 info);
void f77_zhpgvd(FINT itype, const FCHAR jobz, const FCHAR uplo, FINT n, void *ap, void *bp, double * w, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zhpgvx(FINT itype, const FCHAR jobz, const FCHAR range, const FCHAR uplo, FINT n, void *ap, void *bp, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, void *work, double * rwork, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_zhprfs(const FCHAR uplo, FINT n, FINT nrhs, const void *ap, const void *afp, FINT ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zhpsv(const FCHAR uplo, FINT n, FINT nrhs, void *ap, FINT2 ipiv, void *b, FINT ldb, FINT2 info);
void f77_zhpsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void *ap, void *afp, FINT2 ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zhptrd(const FCHAR uplo, FINT n, void *ap, double * d, double * e, void *tau, FINT2 info);
void f77_zhptrf(const FCHAR uplo, FINT n, void *ap, FINT2 ipiv, FINT2 info);
void f77_zhptri(const FCHAR uplo, FINT n, void *ap, FINT ipiv, void *work, FINT2 info);
void f77_zhptrs(const FCHAR uplo, FINT n, FINT nrhs, const void *ap, FINT ipiv, void *b, FINT ldb, FINT2 info);
void f77_zhsein(const FCHAR side, const FCHAR eigsrc, const FCHAR initv, FLOG select, FINT n, const void *h, FINT ldh, void *w, void *vl, FINT ldvl, void *vr, FINT ldvr, FINT mm, FINT2 m, void *work, double * rwork, FINT2 ifaill, FINT2 ifailr, FINT2 info);
void f77_zhseqr(const FCHAR job, const FCHAR compz, FINT n, FINT ilo, FINT ihi, void *h, FINT ldh, void *w, void *z, FINT ldz, void *work, FINT lwork, FINT2 info);
void f77_zlabrd(FINT m, FINT n, FINT nb, void *a, FINT lda, double * d, double * e, void *tauq, void *taup, void *x, FINT ldx, void *y, FINT ldy);
void f77_zlacgv(FINT n, void *x, FINT incx);
void f77_zlacn2(FINT n, void *v, void *x, double * est, FINT2 kase, FINT2 isave);
void f77_zlacon(FINT n, void *v, void *x, double * est, FINT2 kase);
void f77_zlacp2(const FCHAR uplo, FINT m, FINT n, const double * a, FINT lda, void *b, FINT ldb);
void f77_zlacpy(const FCHAR uplo, FINT m, FINT n, const void *a, FINT lda, void *b, FINT ldb);
void f77_zlacrm(FINT m, FINT n, const void *a, FINT lda, const double * b, FINT ldb, const void *c, FINT ldc, double * rwork);
void f77_zlacrt(FINT n, void *cx, FINT incx, void *cy, FINT incy, const void *c, const void *s);
void zladivsub(double* output, const void *x, const void *y);
void f77_zlaed0(FINT qsiz, FINT n, double * d, double * e, void *q, FINT ldq, FINT2 iwork, double * rwork, void *qstore, FINT ldqs, FINT2 info);
void f77_zlaed7(FINT n, FINT cutpnt, FINT qsiz, FINT tlvls, FINT curlvl, FINT curpbm, double * d, void *q, FINT ldq, const double * rho, FINT2 indxq, FINT2 iwork, double * rwork, void *work, double * qstore, FINT2 qptr, FINT prmptr, FINT perm, FINT givptr, FINT givcol, const double * givnum, FINT2 info);
void f77_zlaed8(FINT2 k, FINT n, FINT qsiz, void *q, FINT ldq, double * d, double * rho, FINT cutpnt, const double * z, double * dlamda, void *q2, FINT ldq2, double * w, FINT2 indxp, FINT2 indx, FINT indxq, FINT2 perm, FINT2 givptr, FINT2 givcol, double * givnum, FINT2 info);
void f77_zlaein(FLOG rightv, FLOG noinit, FINT n, const void *h, FINT ldh, const void *w, void *v, void *b, FINT ldb, double * rwork, const double * eps3, const double * smlnum, FINT2 info);
void f77_zlaesy(const void *a, const void *b, const void *c, void *rt1, void *rt2, void *evscal, void *cs1, void *sn1);
void f77_zlaev2(const void *a, const void *b, const void *c, double * rt1, double * rt2, double * cs1, void *sn1);
void f77_zlags2(FLOG upper, const double * a1, const void *a2, const double * a3, const double * b1, const void *b2, const double * b3, double * csu, void *snu, double * csv, void *snv, double * csq, void *snq);
void f77_zlagtm(const FCHAR trans, FINT n, FINT nrhs, const double * alpha, const void *dl, const void *d, const void *du, const void *x, FINT ldx, const double * beta, void *b, FINT ldb);
void f77_zlahef(const FCHAR uplo, FINT n, FINT nb, FINT2 kb, void *a, FINT lda, FINT2 ipiv, void *w, FINT ldw, FINT2 info);
void f77_zlahqr(FLOG wantt, FLOG wantz, FINT n, FINT ilo, FINT ihi, void *h, FINT ldh, void *w, FINT iloz, FINT ihiz, void *z, FINT ldz, FINT2 info);
void f77_zlahrd(FINT n, FINT k, FINT nb, void *a, FINT lda, void *tau, void *t, FINT ldt, void *y, FINT ldy);
void f77_zlaic1(FINT job, FINT j, const void *x, const double * sest, const void *w, const void *gamma, double * sestpr, void *s, void *c);
void f77_zlals0(FINT icompq, FINT nl, FINT nr, FINT sqre, FINT nrhs, void *b, FINT ldb, void *bx, FINT ldbx, FINT perm, FINT givptr, FINT givcol, FINT ldgcol, const double * givnum, FINT ldgnum, const double * poles, const double * difl, const double * difr, const double * z, FINT k, const double * c, const double * s, double * rwork, FINT2 info);
void f77_zlalsa(FINT icompq, FINT smlsiz, FINT n, FINT nrhs, void *b, FINT ldb, void *bx, FINT ldbx, const double * u, FINT ldu, const double * vt, FINT k, const double * difl, const double * difr, const double * z, const double * poles, FINT givptr, FINT givcol, FINT ldgcol, FINT perm, const double * givnum, const double * c, const double * s, double * rwork, FINT2 iwork, FINT2 info);
void f77_zlalsd(const FCHAR uplo, FINT smlsiz, FINT n, FINT nrhs, double * d, double * e, void *b, FINT ldb, const double * rcond, FINT2 rank, void *work, double * rwork, FINT2 iwork, FINT2 info);
void zlangbsub(double* output, const FCHAR norm, FINT n, FINT kl, FINT ku, const void *ab, FINT ldab, double * work);
void zlangesub(double* output, const FCHAR norm, FINT m, FINT n, const void *a, FINT lda, double * work);
void zlangtsub(double* output, const FCHAR norm, FINT n, const void *dl, const void *d, const void *du);
void zlanhbsub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, FINT k, const void *ab, FINT ldab, double * work);
void zlanhesub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, const void *a, FINT lda, double * work);
void zlanhpsub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, const void *ap, double * work);
void zlanhssub(double* output, const FCHAR norm, FINT n, const void *a, FINT lda, double * work);
void zlanhtsub(double* output, const FCHAR norm, FINT n, const double * d, const void *e);
void zlansbsub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, FINT k, const void *ab, FINT ldab, double * work);
void zlanspsub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, const void *ap, double * work);
void zlansysub(double* output, const FCHAR norm, const FCHAR uplo, FINT n, const void *a, FINT lda, double * work);
void zlantbsub(double* output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT k, const void *ab, FINT ldab, double * work);
void zlantpsub(double* output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const void *ap, double * work);
void zlantrsub(double* output, const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT m, FINT n, const void *a, FINT lda, double * work);
void f77_zlapll(FINT n, void *x, FINT incx, void *y, FINT incy, double * ssmin);
void f77_zlapmt(FLOG forwrd, FINT m, FINT n, void *x, FINT ldx, FINT2 k);
void f77_zlaqgb(FINT m, FINT n, FINT kl, FINT ku, void *ab, FINT ldab, const double * r, const double * c, const double * rowcnd, const double * colcnd, const double * amax, FCHAR equed);
void f77_zlaqge(FINT m, FINT n, void *a, FINT lda, const double * r, const double * c, const double * rowcnd, const double * colcnd, const double * amax, FCHAR equed);
void f77_zlaqhb(const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, double * s, const double * scond, const double * amax, FCHAR equed);
void f77_zlaqhe(const FCHAR uplo, FINT n, void *a, FINT lda, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_zlaqhp(const FCHAR uplo, FINT n, void *ap, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_zlaqp2(FINT m, FINT n, FINT offset, void *a, FINT lda, FINT2 jpvt, void *tau, double * vn1, double * vn2, void *work);
void f77_zlaqps(FINT m, FINT n, FINT offset, FINT nb, FINT2 kb, void *a, FINT lda, FINT2 jpvt, void *tau, double * vn1, double * vn2, void *auxv, void *f, FINT ldf);
void f77_zlaqsb(const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_zlaqsp(const FCHAR uplo, FINT n, void *ap, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_zlaqsy(const FCHAR uplo, FINT n, void *a, FINT lda, const double * s, const double * scond, const double * amax, FCHAR equed);
void f77_zlar1v(FINT n, FINT b1, FINT bn, const double * sigma, const double * l, const double * d, const double * ld, const double * lld, const double * gersch, void *z, double * ztz, double * mingma, FINT2 r, FINT2 isuppz, double * work);
void f77_zlar2v(FINT n, void *x, void *y, void *z, FINT incx, const double * c, const void *s, FINT incc);
void f77_zlarcm(FINT m, FINT n, const double * a, FINT lda, const double * b, FINT ldb, const void *c, FINT ldc, double * rwork);
void f77_zlarf(const FCHAR side, FINT m, FINT n, const void *v, FINT incv, const void *tau, void *c, FINT ldc, void *work);
void f77_zlarfb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, const void *v, FINT ldv, const void *t, FINT ldt, void *c, FINT ldc, void *work, FINT ldwork);
void f77_zlarfg(FINT n, void *alpha, void *x, FINT incx, void *tau);
void f77_zlarft(const FCHAR direct, const FCHAR storev, FINT n, FINT k, void *v, FINT ldv, const void *tau, void *t, FINT ldt);
void f77_zlarfx(const FCHAR side, FINT m, FINT n, const void *v, const void *tau, void *c, FINT ldc, void *work);
void f77_zlargv(FINT n, void *x, FINT incx, void *y, FINT incy, double * c, FINT incc);
void f77_zlarnv(FINT idist, FINT2 iseed, FINT n, void *x);
void f77_zlarrv(FINT n, double * d, double * l, FINT isplit, FINT m, const double * w, FINT iblock, const double * gersch, const double * tol, void *z, FINT ldz, FINT2 isuppz, double * work, FINT2 iwork, FINT2 info);
void f77_zlartg(const void *f, const void *g, double * cs, void *sn, void *r);
void f77_zlartv(FINT n, void *x, FINT incx, void *y, FINT incy, const double * c, const void *s, FINT incc);
void f77_zlarz(const FCHAR side, FINT m, FINT n, FINT l, const void *v, FINT incv, const void *tau, void *c, FINT ldc, void *work);
void f77_zlarzb(const FCHAR side, const FCHAR trans, const FCHAR direct, const FCHAR storev, FINT m, FINT n, FINT k, FINT l, const void *v, FINT ldv, const void *t, FINT ldt, void *c, FINT ldc, void *work, FINT ldwork);
void f77_zlarzt(const FCHAR direct, const FCHAR storev, FINT n, FINT k, void *v, FINT ldv, const void *tau, void *t, FINT ldt);
void f77_zlascl(const FCHAR type, FINT kl, FINT ku, const double * cfrom, const double * cto, FINT m, FINT n, void *a, FINT lda, FINT2 info);
void f77_zlaset(const FCHAR uplo, FINT m, FINT n, const void *alpha, const void *beta, void *a, FINT lda);
void f77_zlasr(const FCHAR side, const FCHAR pivot, const FCHAR direct, FINT m, FINT n, const double * c, const double * s, void *a, FINT lda);
void f77_zlassq(FINT n, const void *x, FINT incx, double * scale, double * sumsq);
void f77_zlaswp(FINT n, void *a, FINT lda, FINT k1, FINT k2, FINT ipiv, FINT incx);
void f77_zlasyf(const FCHAR uplo, FINT n, FINT nb, FINT2 kb, void *a, FINT lda, FINT2 ipiv, void *w, FINT ldw, FINT2 info);
void f77_zlatbs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, FINT kd, const void *ab, FINT ldab, void *x, double * scale, double * cnorm, FINT2 info);
void f77_zlatdf(FINT ijob, FINT n, const double * z, FINT ldz, double * rhs, double * rdsum, double * rdscal, FINT ipiv, FINT jpiv);
void f77_zlatps(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const void *ap, void *x, double * scale, double * cnorm, FINT2 info);
void f77_zlatrd(const FCHAR uplo, FINT n, FINT nb, void *a, FINT lda, double * e, void *tau, void *w, FINT ldw);
void f77_zlatrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, const FCHAR normin, FINT n, const void *a, FINT lda, void *x, double * scale, double * cnorm, FINT2 info);
void f77_zlatrz(FINT m, FINT n, FINT l, void *a, FINT lda, void *tau, void *work);
void f77_zlatzm(const FCHAR side, FINT m, FINT n, const void *v, FINT incv, const void *tau, void *c1, void *c2, FINT ldc, void *work);
void f77_zlauu2(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 info);
void f77_zlauum(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 info);
void f77_zpbcon(const FCHAR uplo, FINT n, FINT kd, const void *ab, FINT ldab, const double * anorm, double * rcond, void *work, double * rwork, FINT2 info);
void f77_zpbequ(const FCHAR uplo, FINT n, FINT kd, const void *ab, FINT ldab, double * s, double * scond, double * amax, FINT2 info);
void f77_zpbrfs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const double * ab, FINT ldab, const void *afb, FINT ldafb, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zpbstf(const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, FINT2 info);
void f77_zpbsv(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, void *ab, FINT ldab, void *b, FINT ldb, FINT2 info);
void f77_zpbsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT kd, FINT nrhs, void *ab, FINT ldab, void *afb, FINT ldafb, FCHAR equed, double * s, void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zpbtf2(const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, FINT2 info);
void f77_zpbtrf(const FCHAR uplo, FINT n, FINT kd, void *ab, FINT ldab, FINT2 info);
void f77_zpbtrs(const FCHAR uplo, FINT n, FINT kd, FINT nrhs, const void *ab, FINT ldab, void *b, FINT ldb, FINT2 info);
void f77_zpocon(const FCHAR uplo, FINT n, const void *a, FINT lda, const double * anorm, double * rcond, void *work, double * rwork, FINT2 info);
void f77_zpoequ(FINT n, const void *a, FINT lda, double * s, double * scond, double * amax, FINT2 info);
void f77_zporfs(const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, const void *af, FINT ldaf, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zposv(const FCHAR uplo, FINT n, FINT nrhs, void *a, FINT lda, void *b, FINT ldb, FINT2 info);
void f77_zposvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, void *a, FINT lda, void *af, FINT ldaf, FCHAR equed, double * s, void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zpotf2(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 info);
void f77_zpotrf(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 info);
void f77_zpotri(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 info);
void f77_zpotrs(const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, void *b, FINT ldb, FINT2 info);
void f77_zppcon(const FCHAR uplo, FINT n, const void *ap, const double * anorm, double * rcond, void *work, double * rwork, FINT2 info);
void f77_zppequ(const FCHAR uplo, FINT n, const void *ap, double * s, double * scond, double * amax, FINT2 info);
void f77_zpprfs(const FCHAR uplo, FINT n, FINT nrhs, const void *ap, const void *afp, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zppsv(const FCHAR uplo, FINT n, FINT nrhs, void *ap, void *b, FINT ldb, FINT2 info);
void f77_zppsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, void *ap, void *afp, FCHAR equed, double * s, void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zpptrf(const FCHAR uplo, FINT n, void *ap, FINT2 info);
void f77_zpptri(const FCHAR uplo, FINT n, void *ap, FINT2 info);
void f77_zpptrs(const FCHAR uplo, FINT n, FINT nrhs, const void *ap, void *b, FINT ldb, FINT2 info);
void f77_zptcon(FINT n, const double * d, const void *e, const double * anorm, double * rcond, double * rwork, FINT2 info);
void f77_zpteqr(const FCHAR compz, FINT n, double * d, double * e, void *z, FINT ldz, double * work, FINT2 info);
void f77_zptrfs(const FCHAR uplo, FINT n, FINT nrhs, const double * d, const void *e, const double * df, const void *ef, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zptsv(FINT n, FINT nrhs, double * d, void *e, void *b, FINT ldb, FINT2 info);
void f77_zptsvx(const FCHAR fact, FINT n, FINT nrhs, const double * d, const void *e, double * df, void *ef, const void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zpttrf(FINT n, double * d, void *e, FINT2 info);
void f77_zpttrs(const FCHAR uplo, FINT n, FINT nrhs, const double * d, const void *e, double * b, FINT ldb, FINT2 info);
void f77_zptts2(FINT iuplo, FINT n, FINT nrhs, const double * d, const void *e, double * b, FINT ldb);
void f77_zrot(FINT n, void *cx, FINT incx, void *cy, FINT incy, const double * c, const void *s);
void f77_zspcon(const FCHAR uplo, FINT n, const void *ap, FINT ipiv, const double * anorm, double * rcond, void *work, FINT2 info);
void f77_zspmv(const FCHAR uplo, FINT n, const void *alpha, const void *ap, const void *x, FINT incx, const void *beta, void *y, FINT incy);
void f77_zspr(const FCHAR uplo, FINT n, const void *alpha, const void *x, FINT incx, void *ap);
void f77_zsprfs(const FCHAR uplo, FINT n, FINT nrhs, const void *ap, const void *afp, FINT ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zspsv(const FCHAR uplo, FINT n, FINT nrhs, void *ap, FINT2 ipiv, void *b, FINT ldb, FINT2 info);
void f77_zspsvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void *ap, void *afp, FINT2 ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zsptrf(const FCHAR uplo, FINT n, void *ap, FINT2 ipiv, FINT2 info);
void f77_zsptri(const FCHAR uplo, FINT n, void *ap, FINT ipiv, void *work, FINT2 info);
void f77_zsptrs(const FCHAR uplo, FINT n, FINT nrhs, const void *ap, FINT ipiv, void *b, FINT ldb, FINT2 info);
void f77_zstedc(const FCHAR compz, FINT n, double * d, double * e, void *z, FINT ldz, void *work, FINT lwork, double * rwork, FINT lrwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zstegr(const FCHAR jobz, const FCHAR range, FINT n, double * d, double * e, const double * vl, const double * vu, FINT il, FINT iu, const double * abstol, FINT2 m, double * w, void *z, FINT ldz, FINT2 isuppz, double * work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_zstein(FINT n, const double * d, const double * e, FINT m, const double * w, FINT iblock, FINT isplit, void *z, FINT ldz, double * work, FINT2 iwork, FINT2 ifail, FINT2 info);
void f77_zsteqr(const FCHAR compz, FINT n, double * d, double * e, void *z, FINT ldz, double * work, FINT2 info);
void f77_zsycon(const FCHAR uplo, FINT n, const void *a, FINT lda, FINT ipiv, const double * anorm, double * rcond, void *work, FINT2 info);
void f77_zsymv(const FCHAR uplo, FINT n, const void *alpha, const void *a, FINT lda, const void *x, FINT incx, const void *beta, void *y, FINT incy);
void f77_zsyr(const FCHAR uplo, FINT n, const void *alpha, const void *x, FINT incx, void *a, FINT lda);
void f77_zsyrfs(const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, const void *af, FINT ldaf, FINT ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_zsysv(const FCHAR uplo, FINT n, FINT nrhs, void *a, FINT lda, FINT2 ipiv, void *b, FINT ldb, void *work, FINT lwork, FINT2 info);
void f77_zsysvx(const FCHAR fact, const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, void *af, FINT ldaf, FINT2 ipiv, const void *b, FINT ldb, void *x, FINT ldx, double * rcond, double * ferr, double * berr, void *work, FINT lwork, double * rwork, FINT2 info);
void f77_zsytf2(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 ipiv, FINT2 info);
void f77_zsytrf(const FCHAR uplo, FINT n, void *a, FINT lda, FINT2 ipiv, void *work, FINT lwork, FINT2 info);
void f77_zsytri(const FCHAR uplo, FINT n, void *a, FINT lda, FINT ipiv, void *work, FINT2 info);
void f77_zsytrs(const FCHAR uplo, FINT n, FINT nrhs, const void *a, FINT lda, FINT ipiv, void *b, FINT ldb, FINT2 info);
void f77_ztbcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, FINT kd, const void *ab, FINT ldab, double * rcond, void *work, double * rwork, FINT2 info);
void f77_ztbrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const void *ab, FINT ldab, const void *b, FINT ldb, const void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_ztbtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT kd, FINT nrhs, const void *ab, FINT ldab, void *b, FINT ldb, FINT2 info);
void f77_ztgevc(const FCHAR side, const FCHAR howmny, FLOG select, FINT n, const void *s, FINT lds, const void *p, FINT ldp, void *vl, FINT ldvl, void *vr, FINT ldvr, FINT mm, FINT2 m, void *work, double * rwork, FINT2 info);
void f77_ztgex2(FLOG wantq, FLOG wantz, FINT n, void *a, FINT lda, void *b, FINT ldb, void *q, FINT ldq, void *z, FINT ldz, FINT j1, FINT2 info);
void f77_ztgexc(FLOG wantq, FLOG wantz, FINT n, void *a, FINT lda, void *b, FINT ldb, void *q, FINT ldq, void *z, FINT ldz, FINT ifst, FINT2 ilst, FINT2 info);
void f77_ztgsen(FINT ijob, FLOG wantq, FLOG wantz, FLOG select, FINT n, void *a, FINT lda, void *b, FINT ldb, void *alpha, void *beta, void *q, FINT ldq, void *z, FINT ldz, FINT2 m, double * pl, double * pr, double * dif, void *work, FINT lwork, FINT2 iwork, FINT liwork, FINT2 info);
void f77_ztgsja(const FCHAR jobu, const FCHAR jobv, const FCHAR jobq, FINT m, FINT p, FINT n, FINT k, FINT l, void *a, FINT lda, void *b, FINT ldb, const double * tola, const double * tolb, double * alpha, double * beta, void *u, FINT ldu, void *v, FINT ldv, void *q, FINT ldq, void *work, FINT2 ncycle, FINT2 info);
void f77_ztgsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const void *a, FINT lda, const void *b, FINT ldb, const void *vl, FINT ldvl, const void *vr, FINT ldvr, double * s, double * dif, FINT mm, FINT2 m, void *work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_ztgsy2(const FCHAR trans, FINT ijob, FINT m, FINT n, const void *a, FINT lda, const void *b, FINT ldb, void *c, FINT ldc, const void *d, FINT ldd, const void *e, FINT lde, void *f, FINT ldf, double * scale, double * rdsum, double * rdscal, FINT2 info);
void f77_ztgsyl(const FCHAR trans, FINT ijob, FINT m, FINT n, const void *a, FINT lda, const void *b, FINT ldb, void *c, FINT ldc, const void *d, FINT ldd, const void *e, FINT lde, void *f, FINT ldf, double * dif, double * scale, void *work, FINT lwork, FINT2 iwork, FINT2 info);
void f77_ztpcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const void *ap, double * rcond, void *work, double * rwork, FINT2 info);
void f77_ztprfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void *ap, const void *b, FINT ldb, const void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_ztptri(const FCHAR uplo, const FCHAR diag, FINT n, void *ap, FINT2 info);
void f77_ztptrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void *ap, void *b, FINT ldb, FINT2 info);
void f77_ztrcon(const FCHAR norm, const FCHAR uplo, const FCHAR diag, FINT n, const void *a, FINT lda, double * rcond, void *work, double * rwork, FINT2 info);
void f77_ztrevc(const FCHAR side, const FCHAR howmny, FLOG select, FINT n, void *t, FINT ldt, void *vl, FINT ldvl, void *vr, FINT ldvr, FINT mm, FINT2 m, void *work, double * rwork, FINT2 info);
void f77_ztrexc(const FCHAR compq, FINT n, void *t, FINT ldt, void *q, FINT ldq, FINT ifst, FINT ilst, FINT2 info);
void f77_ztrrfs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void *a, FINT lda, const void *b, FINT ldb, const void *x, FINT ldx, double * ferr, double * berr, void *work, double * rwork, FINT2 info);
void f77_ztrsen(const FCHAR job, const FCHAR compq, FLOG select, FINT n, void *t, FINT ldt, void *q, FINT ldq, void *w, FINT2 m, double * s, double * sep, void *work, FINT lwork, FINT2 info);
void f77_ztrsna(const FCHAR job, const FCHAR howmny, FLOG select, FINT n, const void *t, FINT ldt, const void *vl, FINT ldvl, const void *vr, FINT ldvr, double * s, double * sep, FINT mm, FINT2 m, void *work, FINT ldwork, double * rwork, FINT2 info);
void f77_ztrsyl(const FCHAR trana, const FCHAR tranb, FINT isgn, FINT m, FINT n, const void *a, FINT lda, const void *b, FINT ldb, void *c, FINT ldc, double * scale, FINT2 info);
void f77_ztrti2(const FCHAR uplo, const FCHAR diag, FINT n, void *a, FINT lda, FINT2 info);
void f77_ztrtri(const FCHAR uplo, const FCHAR diag, FINT n, void *a, FINT lda, FINT2 info);
void f77_ztrtrs(const FCHAR uplo, const FCHAR trans, const FCHAR diag, FINT n, FINT nrhs, const void *a, FINT lda, void *b, FINT ldb, FINT2 info);
void f77_ztzrqf(FINT m, FINT n, void *a, FINT lda, void *tau, FINT2 info);
void f77_ztzrzf(FINT m, FINT n, void *a, FINT lda, void *tau, void *work, FINT lwork, FINT2 info);
void f77_zung2l(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT2 info);
void f77_zung2r(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT2 info);
void f77_zungbr(const FCHAR vect, FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT lwork, FINT2 info);
void f77_zunghr(FINT n, FINT ilo, FINT ihi, void *a, FINT lda, const void *tau, void *work, FINT lwork, FINT2 info);
void f77_zungl2(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT2 info);
void f77_zunglq(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT lwork, FINT2 info);
void f77_zungql(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT lwork, FINT2 info);
void f77_zungqr(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT lwork, FINT2 info);
void f77_zungr2(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT2 info);
void f77_zungrq(FINT m, FINT n, FINT k, void *a, FINT lda, const void *tau, void *work, FINT lwork, FINT2 info);
void f77_zungtr(const FCHAR uplo, FINT n, void *a, FINT lda, const void *tau, void *work, FINT lwork, FINT2 info);
void f77_zunm2l(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT2 info);
void f77_zunm2r(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT2 info);
void f77_zunmbr(const FCHAR vect, const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zunmhr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT ilo, FINT ihi, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zunml2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT2 info);
void f77_zunmlq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zunmql(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zunmqr(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zunmr2(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT2 info);
void f77_zunmr3(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT2 info);
void f77_zunmrq(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zunmrz(const FCHAR side, const FCHAR trans, FINT m, FINT n, FINT k, FINT l, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zunmtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const void *a, FINT lda, const void *tau, void *c, FINT ldc, void *work, FINT lwork, FINT2 info);
void f77_zupgtr(const FCHAR uplo, FINT n, const void *ap, const void *tau, void *q, FINT ldq, void *work, FINT2 info);
void f77_zupmtr(const FCHAR side, const FCHAR uplo, const FCHAR trans, FINT m, FINT n, const void *ap, const void *tau, void *c, FINT ldc, void *work, FINT2 info);
#endif /* LAPACK_F77_H */ 
