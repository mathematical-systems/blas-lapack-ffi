#ifndef LAPACK_ENUM_H
#define LAPACK_ENUM_H

  /* Enumerated types */

enum lapack_order_type {
            lapack_rowmajor = 101,
            lapack_colmajor = 102 };

enum lapack_trans_type {
            lapack_no_trans   = 111,
            lapack_trans      = 112,
            lapack_conj_trans = 113 };

enum lapack_uplo_type  {
            lapack_upper	   = 121,
            lapack_lower	   = 122, 
			lapack_upper_lower = 123 };

enum lapack_diag_type {
            lapack_non_unit_diag = 131,
            lapack_unit_diag     = 132 };

enum lapack_side_type {
            lapack_left_side  = 141,
            lapack_right_side = 142 };

enum lapack_cmach_type {
            lapack_base      = 151,
            lapack_t         = 152,
            lapack_rnd       = 153,
            lapack_ieee      = 154,
            lapack_emin      = 155,
            lapack_emax      = 156,
            lapack_eps       = 157,
            lapack_prec      = 158,
            lapack_underflow = 159,
            lapack_overflow  = 160,
            lapack_sfmin     = 161,
            lapack_epsbase   = 162,
            lapack_rmin	     = 163,
            lapack_rmax	     = 164 };

enum lapack_norm_type {
            lapack_one_norm       = 171,
            lapack_real_one_norm  = 172,
            lapack_two_norm       = 173,
            lapack_frobenius_norm = 174,
            lapack_inf_norm       = 175,
            lapack_real_inf_norm  = 176,
            lapack_max_norm       = 177,
            lapack_real_max_norm  = 178 };

enum lapack_sort_type {
            lapack_increasing_order = 181,
            lapack_decreasing_order = 182 };

enum lapack_conj_type {
            lapack_conj    = 191,
            lapack_no_conj = 192 };

enum lapack_jrot_type {
            lapack_jrot_inner  = 201,
            lapack_jrot_outer  = 202,
            lapack_jrot_sorted = 203 };

enum lapack_prec_type {
            lapack_prec_single     = 211,
            lapack_prec_double     = 212,
            lapack_prec_indigenous = 213,
            lapack_prec_extra      = 214 };

enum lapack_base_type {
            lapack_zero_base = 221,
            lapack_one_base  = 222 };

enum lapack_symmetry_type {
            lapack_general	 			      = 231,
            lapack_symmetric			 	  = 232,
            lapack_hermitian			 	  = 233,
            lapack_triangular				  = 234,
            lapack_lower_triangular			  = 235,
            lapack_upper_triangular			  = 236,
            lapack_lower_symmetric			  = 237,
            lapack_upper_symmetric			  = 238,
            lapack_lower_hermitian			  = 239,
            lapack_upper_hermitian			  = 240,
			lapack_symetric_band_lower_stored = 241,
			lapack_symetric_band_upper_stored = 242,
			lapack_band						  = 243, 
			lapack_upper_hessenberg			  = 243 };

enum lapack_size_type {
            lapack_num_rows      = 251,
            lapack_num_cols      = 252,
            lapack_num_nonzeros  = 253  };

enum lapack_handle_type{
            lapack_invalid_handle = 261,
			lapack_new_handle     = 262,
			lapack_open_handle    = 263,
			lapack_valid_handle   = 264};

enum lapack_sparsity_optimization_type {
            lapack_regular       = 271,
            lapack_irregular     = 272,
            lapack_block         = 273,
            lapack_unassembled   = 274 };

enum lapack_balance_type {
			lapack_nothing		 = 281,
			lapack_permute		 = 282,
			lapack_scale		 = 283,
			lapack_permute_scale = 284 };

enum lapack_compute_vectors_type {
			lapack_no_compute_vectors = 291,
			lapack_compute_vectors    = 292 };

enum lapack_condition_number_type {
			lapack_none				= 301,
			lapack_values			= 302,
			lapack_vectors			= 303,
			lapack_values_vectors	= 304 };

enum lapack_range_type {
			lapack_range_all		= 311,
			lapack_interval			= 312,
			lapack_order			= 313 };

enum lapack_form_matrices_type {
			lapack_form_none		= 321,
			lapack_form_qm			= 322,
			lapack_form_pp			= 323,
			lapack_form_both		= 324 };

enum lapack_fact_type {
			lapack_fact_f			= 331,
			lapack_fact_n			= 332,
			lapack_fact_e			= 333 };

enum lapack_ordering_type {
			lapack_do_order			= 341,
			lapack_not_order		= 342 };

enum lapack_compute_type {
			lapack_not_compute		= 351,
			lapack_unitary			= 352,
			lapack_product			= 353 };

enum lapack_eig_source_type {
			lapack_source_chseqr	= 361,
			lapack_no_source		= 362 };

enum lapack_init_vector_type {
			lapack_no_vectors		= 371,
			lapack_user_vectors		= 372 };

enum lapack_equilibration_type {
			lapack_no_equilibration         = 381,
			lapack_row_equilibration        = 382,
			lapack_column_equilibration     = 383,
			lapack_row_column_equilibration = 384 };

enum lapack_direction_type {
			lapack_forward			= 391,
			lapack_backward			= 392 };

enum lapack_store_type {
			lapack_columnwise		= 401,
			lapack_rowwise			= 402 };

enum lapack_pivot_type {
			lapack_variable			= 421,
			lapack_top				= 422,
			lapack_bottom			= 423 };

enum lapack_how_many_type {
			lapack_all				= 431,
			lapack_backtransform	= 432,
			lapack_select			= 433 };

enum lapack_hseqr_type {
			lapack_eigenvalues		= 441,
			lapack_schur_form	    = 442 };

enum lapack_eigenvectors_side_type {
			lapack_left_eigenvectors  = 451,
			lapack_right_eigenvectors = 452,
			lapack_both_eigenvectors  = 453 };

enum lapack_order_block_type {
			lapack_by_block		= 461,
			lapack_matrix		= 462 };

enum lapack_compute_svd_type {
			lapack_all_matrix			= 471,
			lapack_overwritte_u			= 472,
			lapack_overwritte_a			= 473,
			lapack_no_singular_vectors	= 474 };

enum lapack_compute_tgsj_type {
			lapack_ortho_u				= 481,
			lapack_ortho_v				= 482,
			lapack_ortho_q				= 483,
			lapack_unit					= 484,
			lapack_do_not_compute		= 485 };

enum lapack_compute_cond_type {
			lapack_no_cond				= 491,
			lapack_cond_eigenvalues		= 492,
			lapack_cond_eigenvectors	= 493,
			lapack_cond_both			= 494 };
				
enum lapack_form_q_type {
			lapack_do_not_form_q		= 501,
			lapack_form_q				= 502,
			lapack_update_matrix		= 503 };

enum lapack_compute_ortho_type {
			lapack_compute_ortho_u	    = 511,
			lapack_compute_ortho_v	    = 512,
			lapack_compute_ortho_q	    = 513,
			lapack_do_not_compute_ortho = 514 };

enum lapack_field_type {
            lapack_complex          = 521,
            lapack_real             = 522,
            lapack_double_precision = 523,
            lapack_single_precision = 524  };

enum lapack_column_norm_type {
			lapack_column_norm		= 531,
			lapack_no_column_norm	= 532 };

enum lapack_reciprocal_condition_type {
			lapack_no_reciprocal	= 541,
			lapack_average_selected = 542,
			lapack_selected_right_subspace = 543,
			lapack_both_reciprocal = 544 };

enum lapack_form_x_type {
			lapack_do_not_form_x		= 551,
			lapack_form_x				= 552 };
#endif


   /* lapack_ENUM_H */
