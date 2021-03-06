      PROGRAM DCHKEE
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*  Purpose
*  =======
*
*  DCHKEE tests the DOUBLE PRECISION LAPACK subroutines for the matrix
*  eigenvalue problem.  The test paths in this version are
*
*  NEP (Nonsymmetric Eigenvalue Problem):
*      Test cdgehrd, cdorghr, cdhseqr, cdtrevc, cdhsein, and cdormhr
*
*  SEP (Symmetric Eigenvalue Problem):
*      Test cdsytrd, cdorgtr, cdsteqr, cdsterf, cdstein, cdstedc,
*      and drivers cdsyev(X), cdsbev(X), cdspev(X), cdstev(X),
*                  cdsyevD,   cdsbevD,   cdspevD,   cdstevD
*
*  SVD (Singular Value Decomposition):
*      Test cdgebrd, cdorgbr, cdbdsqr, cdbdsdc
*      and the drivers cdgesvD, cdgesdd
*
*  DEV (Nonsymmetric Eigenvalue/eigenvector Driver):
*      Test cdgeev
*
*  DES (Nonsymmetric Schur form Driver):
*      Test cdgees
*
*  DVX (Nonsymmetric Eigenvalue/eigenvector Expert Driver):
*      Test cdgeevX
*
*  DSX (Nonsymmetric Schur form Expert Driver):
*      Test cdgeesX
*
*  DGG (Generalized Nonsymmetric Eigenvalue Problem):
*      Test cdgghrd, cdggbal, cdggbak, cdhgeqz, and cdtgevc
*      and the driver routines cdgegs and cdgegv
*
*  DGS (Generalized Nonsymmetric Schur form Driver):
*      Test cdgges
*
*  DGV (Generalized Nonsymmetric Eigenvalue/eigenvector Driver):
*      Test cdggev
*
*  DGX (Generalized Nonsymmetric Schur form Expert Driver):
*      Test cdggesX
*
*  DXV (Generalized Nonsymmetric Eigenvalue/eigenvector Expert Driver):
*      Test cdggevX
*
*  DSG (Symmetric Generalized Eigenvalue Problem):
*      Test cdsygst, cdsygv, cdsygvD, cdsygvX, cdspgst, cdspgv, cdspgvD,
*      cdspgvX, cdsbgst, cdsbgv, cdsbgvD, and cdsbgvX
*
*  DSB (Symmetric Band Eigenvalue Problem):
*      Test cdsbtrd
*
*  DBB (Band Singular Value Decomposition):
*      Test cdgbbrd
*
*  DEC (Eigencondition estimation):
*      Test cdlaln2, cdlasy2,
*      DLAEQU, cdlaexc, cdtrsyl, cdtrexc, cdtrsna,
*      cdtrsen, and cdlaqtr
*
*  DBL (Balancing a general matrix)
*      Test cdgebal
*
*  DBK (Back transformation on a balanced matrix)
*      Test cdgebak
*
*  DGL (Balancing a matrix pair)
*      Test cdggbal
*
*  DGK (Back transformation on a matrix pair)
*      Test cdggbak
*
*  GLM (Generalized Linear Regression Model):
*      Tests cdggglm
*
*  GQR (Generalized QR and RQ factorizations):
*      Tests cdggqrf and cdggrqf
*
*  GSV (Generalized Singular Value Decomposition):
*      Tests cdggsvd, cdggsvp, cdtgsja, cdlags2, cdlapll, and cdlapmt
*
*  LSE (Constrained Linear Least Squares):
*      Tests cdgglse
*
*  Each test path has a different set of inputs, but the data sets for
*  the driver routines xEV, xES, xVX, and xSX can be concatenated in a
*  single input file.  The first line of input should contain one of the
*  3-character path names in columns 1-3.  The number of remaining lines
*  depends on what is found on the first line.
*
*  The number of matrix types used in testing is often controllable from
*  the input file.  The number of matrix types for each path, and the
*  test routine that describes them, is as follows:
*
*  Path name(s)  Types    Test routine
*
*  DHS or NEP      21     DCHKHS
*  DST or SEP      21     DCHKST (routines)
*                  18     DDRVST (drivers)
*  DBD or SVD      16     DCHKBD (routines)
*                   5     DDRVBD (drivers)
*  DEV             21     DDRVEV
*  DES             21     DDRVES
*  DVX             21     DDRVVX
*  DSX             21     DDRVSX
*  DGG             26     DCHKGG (routines)
*                  26     DDRVGG (drivers)
*  DGS             26     DDRGES
*  DGX              5     DDRGSX
*  DGV             26     DDRGEV
*  DXV              2     DDRGVX
*  DSG             21     DDRVSG
*  DSB             15     DCHKSB
*  DBB             15     DCHKBB
*  DEC              -     DCHKEC
*  DBL              -     DCHKBL
*  DBK              -     DCHKBK
*  DGL              -     DCHKGL
*  DGK              -     DCHKGK
*  GLM              8     DCKGLM
*  GQR              8     DCKGQR
*  GSV              8     DCKGSV
*  LSE              8     DCKLSE
*
*-----------------------------------------------------------------------
*
*  NEP input file:
*
*  line 2:  NN, INTEGER
*           Number of values of N.
*
*  line 3:  NVAL, INTEGER array, dimension (NN)
*           The values for the matrix dimension N.
*
*  line 4:  NPARMS, INTEGER
*           Number of values of the parameters NB, NBMIN, NX, NS, and
*           MAXB.
*
*  line 5:  NBVAL, INTEGER array, dimension (NPARMS)
*           The values for the blocksize NB.
*
*  line 6:  NBMIN, INTEGER array, dimension (NPARMS)
*           The values for the minimum blocksize NBMIN.
*
*  line 7:  NXVAL, INTEGER array, dimension (NPARMS)
*           The values for the crossover point NX.
*
*  line 8:  NSVAL, INTEGER array, dimension (NPARMS)
*           The values for the number of shifts.
*
*  line 9:  MXBVAL, INTEGER array, dimension (NPARMS)
*           The values for MAXB, used in determining minimum blocksize.
*
*  line 10: THRESH
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.  To have all of the test
*           ratios printed, use THRESH = 0.0 .
*
*  line 11: NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 11 was 2:
*
*  line 12: INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 12-EOF:  The remaining lines occur in sets of 1 or 2 and allow
*           the user to specify the matrix types.  Each line contains
*           a 3-character path name in columns 1-3, and the number
*           of matrix types must be the first nonblank item in columns
*           4-80.  If the number of matrix types is at least 1 but is
*           less than the maximum number of possible types, a second
*           line will be read to get the numbers of the matrix types to
*           be used.  For example,
*  NEP 21
*           requests all of the matrix types for the nonsymmetric
*           eigenvalue problem, while
*  NEP  4
*  9 10 11 12
*           requests only matrices of type 9, 10, 11, and 12.
*
*           The valid 3-character path names are 'NEP' or 'SHS' for the
*           nonsymmetric eigenvalue routines.
*
*-----------------------------------------------------------------------
*
*  SEP or DSG input file:
*
*  line 2:  NN, INTEGER
*           Number of values of N.
*
*  line 3:  NVAL, INTEGER array, dimension (NN)
*           The values for the matrix dimension N.
*
*  line 4:  NPARMS, INTEGER
*           Number of values of the parameters NB, NBMIN, and NX.
*
*  line 5:  NBVAL, INTEGER array, dimension (NPARMS)
*           The values for the blocksize NB.
*
*  line 6:  NBMIN, INTEGER array, dimension (NPARMS)
*           The values for the minimum blocksize NBMIN.
*
*  line 7:  NXVAL, INTEGER array, dimension (NPARMS)
*           The values for the crossover point NX.
*
*  line 8:  THRESH
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 9:  TSTCHK, LOGICAL
*           Flag indicating whether or not to test the LAPACK routines.
*
*  line 10: TSTDRV, LOGICAL
*           Flag indicating whether or not to test the driver routines.
*
*  line 11: TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 12: NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 12 was 2:
*
*  line 13: INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 13-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path names are 'SEP' or 'SST' for the
*           symmetric eigenvalue routines and driver routines, and
*           'DSG' for the routines for the symmetric generalized
*           eigenvalue problem.
*
*-----------------------------------------------------------------------
*
*  SVD input file:
*
*  line 2:  NN, INTEGER
*           Number of values of M and N.
*
*  line 3:  MVAL, INTEGER array, dimension (NN)
*           The values for the matrix row dimension M.
*
*  line 4:  NVAL, INTEGER array, dimension (NN)
*           The values for the matrix column dimension N.
*
*  line 5:  NPARMS, INTEGER
*           Number of values of the parameter NB, NBMIN, NX, and NRHS.
*
*  line 6:  NBVAL, INTEGER array, dimension (NPARMS)
*           The values for the blocksize NB.
*
*  line 7:  NBMIN, INTEGER array, dimension (NPARMS)
*           The values for the minimum blocksize NBMIN.
*
*  line 8:  NXVAL, INTEGER array, dimension (NPARMS)
*           The values for the crossover point NX.
*
*  line 9:  NSVAL, INTEGER array, dimension (NPARMS)
*           The values for the number of right hand sides NRHS.
*
*  line 10: THRESH
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 11: TSTCHK, LOGICAL
*           Flag indicating whether or not to test the LAPACK routines.
*
*  line 12: TSTDRV, LOGICAL
*           Flag indicating whether or not to test the driver routines.
*
*  line 13: TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 14: NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 14 was 2:
*
*  line 15: INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 15-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path names are 'SVD' or 'SBD' for both the
*           SVD routines and the SVD driver routines.
*
*-----------------------------------------------------------------------
*
*  DEV and DES data files:
*
*  line 1:  'DEV' or 'DES' in columns 1 to 3.
*
*  line 2:  NSIZES, INTEGER
*           Number of sizes of matrices to use. Should be at least 0
*           and at most 20. If NSIZES = 0, no testing is done
*           (although the remaining  3 lines are still read).
*
*  line 3:  NN, INTEGER array, dimension(NSIZES)
*           Dimensions of matrices to be tested.
*
*  line 4:  NB, NBMIN, NX, NS, NBCOL, INTEGERs
*           These integer parameters determine how blocking is done
*           (see ILAENV for details)
*           NB     : block size
*           NBMIN  : minimum block size
*           NX     : minimum dimension for blocking
*           NS     : number of shifts in xHSEQR
*           NBCOL  : minimum column dimension for blocking
*
*  line 5:  THRESH, REAL
*           The test threshold against which computed residuals are
*           compared. Should generally be in the range from 10. to 20.
*           If it is 0., all test case data will be printed.
*
*  line 6:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits.
*
*  line 7:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 7 was 2:
*
*  line 8:  INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 9 and following:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'DEV' to test csgeev, or
*           'DES' to test csgees.
*
*-----------------------------------------------------------------------
*
*  The DVX data has two parts. The first part is identical to DEV,
*  and the second part consists of test matrices with precomputed
*  solutions.
*
*  line 1:  'DVX' in columns 1-3.
*
*  line 2:  NSIZES, INTEGER
*           If NSIZES = 0, no testing of randomly generated examples
*           is done, but any precomputed examples are tested.
*
*  line 3:  NN, INTEGER array, dimension(NSIZES)
*
*  line 4:  NB, NBMIN, NX, NS, NBCOL, INTEGERs
*
*  line 5:  THRESH, REAL
*
*  line 6:  TSTERR, LOGICAL
*
*  line 7:  NEWSD, INTEGER
*
*  If line 7 was 2:
*
*  line 8:  INTEGER array, dimension (4)
*
*  lines 9 and following: The first line contains 'DVX' in columns 1-3
*           followed by the number of matrix types, possibly with
*           a second line to specify certain matrix types.
*           If the number of matrix types = 0, no testing of randomly
*           generated examples is done, but any precomputed examples
*           are tested.
*
*  remaining lines : Each matrix is stored on 1+2*N lines, where N is
*           its dimension. The first line contains the dimension (a
*           single integer). The next N lines contain the matrix, one
*           row per line. The last N lines correspond to each
*           eigenvalue. Each of these last N lines contains 4 real
*           values: the real part of the eigenvalue, the imaginary
*           part of the eigenvalue, the reciprocal condition number of
*           the eigenvalues, and the reciprocal condition number of the
*           eigenvector.  The end of data is indicated by dimension N=0.
*           Even if no data is to be tested, there must be at least one
*           line containing N=0.
*
*-----------------------------------------------------------------------
*
*  The DSX data is like DVX. The first part is identical to DEV, and the
*  second part consists of test matrices with precomputed solutions.
*
*  line 1:  'DSX' in columns 1-3.
*
*  line 2:  NSIZES, INTEGER
*           If NSIZES = 0, no testing of randomly generated examples
*           is done, but any precomputed examples are tested.
*
*  line 3:  NN, INTEGER array, dimension(NSIZES)
*
*  line 4:  NB, NBMIN, NX, NS, NBCOL, INTEGERs
*
*  line 5:  THRESH, REAL
*
*  line 6:  TSTERR, LOGICAL
*
*  line 7:  NEWSD, INTEGER
*
*  If line 7 was 2:
*
*  line 8:  INTEGER array, dimension (4)
*
*  lines 9 and following: The first line contains 'DSX' in columns 1-3
*           followed by the number of matrix types, possibly with
*           a second line to specify certain matrix types.
*           If the number of matrix types = 0, no testing of randomly
*           generated examples is done, but any precomputed examples
*           are tested.
*
*  remaining lines : Each matrix is stored on 3+N lines, where N is its
*           dimension. The first line contains the dimension N and the
*           dimension M of an invariant subspace. The second line
*           contains M integers, identifying the eigenvalues in the
*           invariant subspace (by their position in a list of
*           eigenvalues ordered by increasing real part). The next N
*           lines contain the matrix. The last line contains the
*           reciprocal condition number for the average of the selected
*           eigenvalues, and the reciprocal condition number for the
*           corresponding right invariant subspace. The end of data is
*           indicated by a line containing N=0 and M=0. Even if no data
*           is to be tested, there must be at least one line containing
*           N=0 and M=0.
*
*-----------------------------------------------------------------------
*
*  DGG input file:
*
*  line 2:  NN, INTEGER
*           Number of values of N.
*
*  line 3:  NVAL, INTEGER array, dimension (NN)
*           The values for the matrix dimension N.
*
*  line 4:  NPARMS, INTEGER
*           Number of values of the parameters NB, NBMIN, NS, MAXB, and
*           NBCOL.
*
*  line 5:  NBVAL, INTEGER array, dimension (NPARMS)
*           The values for the blocksize NB.
*
*  line 6:  NBMIN, INTEGER array, dimension (NPARMS)
*           The values for NBMIN, the minimum row dimension for blocks.
*
*  line 7:  NSVAL, INTEGER array, dimension (NPARMS)
*           The values for the number of shifts.
*
*  line 8:  MXBVAL, INTEGER array, dimension (NPARMS)
*           The values for MAXB, used in determining minimum blocksize.
*
*  line 9:  NBCOL, INTEGER array, dimension (NPARMS)
*           The values for NBCOL, the minimum column dimension for
*           blocks.
*
*  line 10: THRESH
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 11: TSTCHK, LOGICAL
*           Flag indicating whether or not to test the LAPACK routines.
*
*  line 12: TSTDRV, LOGICAL
*           Flag indicating whether or not to test the driver routines.
*
*  line 13: TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 14: NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 14 was 2:
*
*  line 15: INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 15-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'DGG' for the generalized
*           eigenvalue problem routines and driver routines.
*
*-----------------------------------------------------------------------
*
*  DGS and DGV input files:
*
*  line 1:  'DGS' or 'DGV' in columns 1 to 3.
*
*  line 2:  NN, INTEGER
*           Number of values of N.
*
*  line 3:  NVAL, INTEGER array, dimension(NN)
*           Dimensions of matrices to be tested.
*
*  line 4:  NB, NBMIN, NX, NS, NBCOL, INTEGERs
*           These integer parameters determine how blocking is done
*           (see ILAENV for details)
*           NB     : block size
*           NBMIN  : minimum block size
*           NX     : minimum dimension for blocking
*           NS     : number of shifts in xHGEQR
*           NBCOL  : minimum column dimension for blocking
*
*  line 5:  THRESH, REAL
*           The test threshold against which computed residuals are
*           compared. Should generally be in the range from 10. to 20.
*           If it is 0., all test case data will be printed.
*
*  line 6:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits.
*
*  line 7:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 17 was 2:
*
*  line 7:  INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 7-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'DGS' for the generalized
*           eigenvalue problem routines and driver routines.
*
*-----------------------------------------------------------------------
*
*  DXV input files:
*
*  line 1:  'DXV' in columns 1 to 3.
*
*  line 2:  N, INTEGER
*           Value of N.
*
*  line 3:  NB, NBMIN, NX, NS, NBCOL, INTEGERs
*           These integer parameters determine how blocking is done
*           (see ILAENV for details)
*           NB     : block size
*           NBMIN  : minimum block size
*           NX     : minimum dimension for blocking
*           NS     : number of shifts in xHGEQR
*           NBCOL  : minimum column dimension for blocking
*
*  line 4:  THRESH, REAL
*           The test threshold against which computed residuals are
*           compared. Should generally be in the range from 10. to 20.
*           Information will be printed about each test for which the
*           test ratio is greater than or equal to the threshold.
*
*  line 5:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 6:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 6 was 2:
*
*  line 7: INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  If line 2 was 0:
*
*  line 7-EOF: Precomputed examples are tested.
*
*  remaining lines : Each example is stored on 3+2*N lines, where N is
*           its dimension. The first line contains the dimension (a
*           single integer). The next N lines contain the matrix A, one
*           row per line. The next N lines contain the matrix B.  The
*           next line contains the reciprocals of the eigenvalue
*        condition numbers.  The last line contains the reciprocals of
*           the eigenvector condition numbers.  The end of data is
*        indicated by dimension N=0.  Even if no data is to be tested,
*           there must be at least one line containing N=0.
*
*-----------------------------------------------------------------------
*
*  DGX input files:
*
*  line 1:  'DGX' in columns 1 to 3.
*
*  line 2:  N, INTEGER
*           Value of N.
*
*  line 3:  NB, NBMIN, NX, NS, NBCOL, INTEGERs
*           These integer parameters determine how blocking is done
*           (see ILAENV for details)
*           NB     : block size
*           NBMIN  : minimum block size
*           NX     : minimum dimension for blocking
*           NS     : number of shifts in xHGEQR
*           NBCOL  : minimum column dimension for blocking
*
*  line 4:  THRESH, REAL
*           The test threshold against which computed residuals are
*           compared. Should generally be in the range from 10. to 20.
*           Information will be printed about each test for which the
*           test ratio is greater than or equal to the threshold.
*
*  line 5:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 6:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 6 was 2:
*
*  line 7: INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  If line 2 was 0:
*
*  line 7-EOF: Precomputed examples are tested.
*
*  remaining lines : Each example is stored on 3+2*N lines, where N is
*           its dimension. The first line contains the dimension (a
*          single integer).  The next line contains an integer k such
*          that only the last k eigenvalues will be selected and appear
*           in the leading diagonal blocks of $A$ and $B$. The next N
*           lines contain the matrix A, one row per line.  The next N
*           lines contain the matrix B.  The last line contains the
*         reciprocal of the eigenvalue cluster condition number and the
*           reciprocal of the deflating subspace (associated with the
*           selected eigencluster) condition number.  The end of data is
*          indicated by dimension N=0.  Even if no data is to be tested,
*           there must be at least one line containing N=0.
*
*-----------------------------------------------------------------------
*
*  DSB input file:
*
*  line 2:  NN, INTEGER
*           Number of values of N.
*
*  line 3:  NVAL, INTEGER array, dimension (NN)
*           The values for the matrix dimension N.
*
*  line 4:  NK, INTEGER
*           Number of values of K.
*
*  line 5:  KVAL, INTEGER array, dimension (NK)
*           The values for the matrix dimension K.
*
*  line 6:  THRESH
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 7:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 7 was 2:
*
*  line 8:  INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 8-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'DSB'.
*
*-----------------------------------------------------------------------
*
*  DBB input file:
*
*  line 2:  NN, INTEGER
*           Number of values of M and N.
*
*  line 3:  MVAL, INTEGER array, dimension (NN)
*           The values for the matrix row dimension M.
*
*  line 4:  NVAL, INTEGER array, dimension (NN)
*           The values for the matrix column dimension N.
*
*  line 4:  NK, INTEGER
*           Number of values of K.
*
*  line 5:  KVAL, INTEGER array, dimension (NK)
*           The values for the matrix bandwidth K.
*
*  line 6:  NPARMS, INTEGER
*           Number of values of the parameter NRHS
*
*  line 7:  NSVAL, INTEGER array, dimension (NPARMS)
*           The values for the number of right hand sides NRHS.
*
*  line 8:  THRESH
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 9:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 9 was 2:
*
*  line 10: INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 10-EOF:  Lines specifying matrix types, as for SVD.
*           The 3-character path name is 'DBB'.
*
*-----------------------------------------------------------------------
*
*  DEC input file:
*
*  line  2: THRESH, REAL
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  lines  3-EOF:
*
*  Input for testing the eigencondition routines consists of a set of
*  specially constructed test cases and their solutions.  The data
*  format is not intended to be modified by the user.
*
*-----------------------------------------------------------------------
*
*  DBL and DBK input files:
*
*  line 1:  'DBL' in columns 1-3 to test csgebal, or 'DBK' in
*           columns 1-3 to test csgebak.
*
*  The remaining lines consist of specially constructed test cases.
*
*-----------------------------------------------------------------------
*
*  DGL and DGK input files:
*
*  line 1:  'DGL' in columns 1-3 to test cdggbal, or 'DGK' in
*           columns 1-3 to test cdggbak.
*
*  The remaining lines consist of specially constructed test cases.
*
*-----------------------------------------------------------------------
*
*  GLM data file:
*
*  line 1:  'GLM' in columns 1 to 3.
*
*  line 2:  NN, INTEGER
*           Number of values of M, P, and N.
*
*  line 3:  MVAL, INTEGER array, dimension(NN)
*           Values of M (row dimension).
*
*  line 4:  PVAL, INTEGER array, dimension(NN)
*           Values of P (row dimension).
*
*  line 5:  NVAL, INTEGER array, dimension(NN)
*           Values of N (column dimension), note M <= N <= M+P.
*
*  line 6:  THRESH, REAL
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 7:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 8:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 8 was 2:
*
*  line 9:  INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 9-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'GLM' for the generalized
*           linear regression model routines.
*
*-----------------------------------------------------------------------
*
*  GQR data file:
*
*  line 1:  'GQR' in columns 1 to 3.
*
*  line 2:  NN, INTEGER
*           Number of values of M, P, and N.
*
*  line 3:  MVAL, INTEGER array, dimension(NN)
*           Values of M.
*
*  line 4:  PVAL, INTEGER array, dimension(NN)
*           Values of P.
*
*  line 5:  NVAL, INTEGER array, dimension(NN)
*           Values of N.
*
*  line 6:  THRESH, REAL
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 7:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 8:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 8 was 2:
*
*  line 9:  INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 9-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'GQR' for the generalized
*           QR and RQ routines.
*
*-----------------------------------------------------------------------
*
*  GSV data file:
*
*  line 1:  'GSV' in columns 1 to 3.
*
*  line 2:  NN, INTEGER
*           Number of values of M, P, and N.
*
*  line 3:  MVAL, INTEGER array, dimension(NN)
*           Values of M (row dimension).
*
*  line 4:  PVAL, INTEGER array, dimension(NN)
*           Values of P (row dimension).
*
*  line 5:  NVAL, INTEGER array, dimension(NN)
*           Values of N (column dimension).
*
*  line 6:  THRESH, REAL
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 7:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 8:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 8 was 2:
*
*  line 9:  INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 9-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'GSV' for the generalized
*           SVD routines.
*
*-----------------------------------------------------------------------
*
*  LSE data file:
*
*  line 1:  'LSE' in columns 1 to 3.
*
*  line 2:  NN, INTEGER
*           Number of values of M, P, and N.
*
*  line 3:  MVAL, INTEGER array, dimension(NN)
*           Values of M.
*
*  line 4:  PVAL, INTEGER array, dimension(NN)
*           Values of P.
*
*  line 5:  NVAL, INTEGER array, dimension(NN)
*           Values of N, note P <= N <= P+M.
*
*  line 6:  THRESH, REAL
*           Threshold value for the test ratios.  Information will be
*           printed about each test for which the test ratio is greater
*           than or equal to the threshold.
*
*  line 7:  TSTERR, LOGICAL
*           Flag indicating whether or not to test the error exits for
*           the LAPACK routines and driver routines.
*
*  line 8:  NEWSD, INTEGER
*           A code indicating how to set the random number seed.
*           = 0:  Set the seed to a default value before each run
*           = 1:  Initialize the seed to a default value only before the
*                 first run
*           = 2:  Like 1, but use the seed values on the next line
*
*  If line 8 was 2:
*
*  line 9:  INTEGER array, dimension (4)
*           Four integer values for the random number seed.
*
*  lines 9-EOF:  Lines specifying matrix types, as for NEP.
*           The 3-character path name is 'GSV' for the generalized
*           SVD routines.
*
*-----------------------------------------------------------------------
*
*  NMAX is currently set to 132 and must be at least 12 for some of the
*  precomputed examples, and LWORK = NMAX*(5*NMAX+5)+1 in the parameter
*  statements below.  For SVD, we assume NRHS may be as big as N.  The
*  parameter NEED is set to 14 to allow for 14 N-by-N matrices for DGG.
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            NMAX
      PARAMETER          ( NMAX = 132 )
      INTEGER            NCMAX
      PARAMETER          ( NCMAX = 20 )
      INTEGER            NEED
      PARAMETER          ( NEED = 14 )
      INTEGER            LWORK
      PARAMETER          ( LWORK = NMAX*( 5*NMAX+5 )+1 )
      INTEGER            LIWORK
      PARAMETER          ( LIWORK = NMAX*( 5*NMAX+20 ) )
      INTEGER            MAXIN
      PARAMETER          ( MAXIN = 20 )
      INTEGER            MAXT
      PARAMETER          ( MAXT = 30 )
      INTEGER            NIN, NOUT
      PARAMETER          ( NIN = 5, NOUT = 6 )
*     ..
*     .. Local Scalars ..
      LOGICAL            DBB, DGG, DSB, FATAL, GLM, GQR, GSV, LSE, NEP,
     $                   DBK, DBL, SEP, DES, DEV, DGK, DGL, DGS, DGV,
     $                   DGX, DSX, SVD, DVX, DXV, TSTCHK, TSTDIF,
     $                   TSTDRV, TSTERR
      CHARACTER          C1
      CHARACTER*3        C3, PATH
      CHARACTER*7        VNAME
      CHARACTER*10       INTSTR
      CHARACTER*80       LINE
      INTEGER            I, I1, IC, INFO, ITMP, K, LENP, MAXTYP, NEWSD,
     $                   NK, NN, NPARMS, NRHS, NTYPES
      DOUBLE PRECISION   EPS, S1, S2, THRESH, THRSHN
*     ..
*     .. Local Arrays ..
      LOGICAL            DOTYPE( MAXT ), LOGWRK( NMAX )
      INTEGER            IOLDSD( 4 ), ISEED( 4 ), IWORK( LIWORK ),
     $                   KVAL( MAXIN ), MVAL( MAXIN ), MXBVAL( MAXIN ),
     $                   NBCOL( MAXIN ), NBMIN( MAXIN ), NBVAL( MAXIN ),
     $                   NSVAL( MAXIN ), NVAL( MAXIN ), NXVAL( MAXIN ),
     $                   PVAL( MAXIN )
      DOUBLE PRECISION   A( NMAX*NMAX, NEED ), B( NMAX*NMAX, 5 ),
     $                   C( NCMAX*NCMAX, NCMAX*NCMAX ), D( NMAX, 12 ),
     $                   RESULT( 500 ), TAUA( NMAX ), TAUB( NMAX ),
     $                   WORK( LWORK ), X( 5*NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      DOUBLE PRECISION   DLAMCH, DSECND
      EXTERNAL           LSAMEN, DLAMCH, DSECND
*     ..
*     .. External Subroutines ..
      EXTERNAL           ALAREQ, DCHKBB, DCHKBD, DCHKBK, DCHKBL, DCHKEC,
     $                   DCHKGG, DCHKGK, DCHKGL, DCHKHS, DCHKSB, DCHKST,
     $                   DCKGLM, DCKGQR, DCKGSV, DCKLSE, DDRGES, DDRGEV,
     $                   DDRGSX, DDRGVX, DDRVBD, DDRVES, DDRVEV, DDRVGG,
     $                   DDRVSG, DDRVST, DDRVSX, DDRVVX, DERRBD, DERRED,
     $                   DERRGG, DERRHS, DERRST, XLAENV
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          LEN, MIN
*     ..
*     .. Scalars in Common ..
      LOGICAL            LERR, OK
      CHARACTER*7        SRNAMT
      INTEGER            INFOT, MAXB, NPROC, NSHIFT, NUNIT, SELDIM,
     $                   SELOPT
*     ..
*     .. Arrays in Common ..
      LOGICAL            SELVAL( 20 )
      INTEGER            IPARMS( 100 )
      DOUBLE PRECISION   SELWI( 20 ), SELWR( 20 )
*     ..
*     .. Common blocks ..
      COMMON             / CENVIR / NPROC, NSHIFT, MAXB
      COMMON             / INFOC / INFOT, NUNIT, OK, LERR
      COMMON             / SRNAMC / SRNAMT
      COMMON             / SSLCT / SELOPT, SELDIM, SELVAL, SELWR, SELWI
      COMMON             / ZLAENV / IPARMS
*     ..
*     .. Data statements ..
      DATA               INTSTR / '0123456789' /
      DATA               IOLDSD / 0, 0, 0, 1 /
*     ..
*     .. Executable Statements ..
*
      S1 = DSECND( )
      FATAL = .FALSE.
      NUNIT = NOUT
*
*     Return to here to read multiple sets of data
*
   10 CONTINUE
*
*     Read the first line and set the 3-character test path
*
      READ( NIN, FMT = '(A80)', END = 380 )LINE
      PATH = LINE( 1: 3 )
      NEP = LSAMEN( 3, PATH, 'NEP' ) .OR. LSAMEN( 3, PATH, 'DHS' )
      SEP = LSAMEN( 3, PATH, 'SEP' ) .OR. LSAMEN( 3, PATH, 'DST' ) .OR.
     $      LSAMEN( 3, PATH, 'DSG' )
      SVD = LSAMEN( 3, PATH, 'SVD' ) .OR. LSAMEN( 3, PATH, 'DBD' )
      DEV = LSAMEN( 3, PATH, 'DEV' )
      DES = LSAMEN( 3, PATH, 'DES' )
      DVX = LSAMEN( 3, PATH, 'DVX' )
      DSX = LSAMEN( 3, PATH, 'DSX' )
      DGG = LSAMEN( 3, PATH, 'DGG' )
      DGS = LSAMEN( 3, PATH, 'DGS' )
      DGX = LSAMEN( 3, PATH, 'DGX' )
      DGV = LSAMEN( 3, PATH, 'DGV' )
      DXV = LSAMEN( 3, PATH, 'DXV' )
      DSB = LSAMEN( 3, PATH, 'DSB' )
      DBB = LSAMEN( 3, PATH, 'DBB' )
      GLM = LSAMEN( 3, PATH, 'GLM' )
      GQR = LSAMEN( 3, PATH, 'GQR' ) .OR. LSAMEN( 3, PATH, 'GRQ' )
      GSV = LSAMEN( 3, PATH, 'GSV' )
      LSE = LSAMEN( 3, PATH, 'LSE' )
      DBL = LSAMEN( 3, PATH, 'DBL' )
      DBK = LSAMEN( 3, PATH, 'DBK' )
      DGL = LSAMEN( 3, PATH, 'DGL' )
      DGK = LSAMEN( 3, PATH, 'DGK' )
*
*     Report values of parameters.
*
      IF( PATH.EQ.'   ' ) THEN
         GO TO 10
      ELSE IF( NEP ) THEN
         WRITE( NOUT, FMT = 9987 )
      ELSE IF( SEP ) THEN
         WRITE( NOUT, FMT = 9986 )
      ELSE IF( SVD ) THEN
         WRITE( NOUT, FMT = 9985 )
      ELSE IF( DEV ) THEN
         WRITE( NOUT, FMT = 9979 )
      ELSE IF( DES ) THEN
         WRITE( NOUT, FMT = 9978 )
      ELSE IF( DVX ) THEN
         WRITE( NOUT, FMT = 9977 )
      ELSE IF( DSX ) THEN
         WRITE( NOUT, FMT = 9976 )
      ELSE IF( DGG ) THEN
         WRITE( NOUT, FMT = 9975 )
      ELSE IF( DGS ) THEN
         WRITE( NOUT, FMT = 9964 )
      ELSE IF( DGX ) THEN
         WRITE( NOUT, FMT = 9965 )
      ELSE IF( DGV ) THEN
         WRITE( NOUT, FMT = 9963 )
      ELSE IF( DXV ) THEN
         WRITE( NOUT, FMT = 9962 )
      ELSE IF( DSB ) THEN
         WRITE( NOUT, FMT = 9974 )
      ELSE IF( DBB ) THEN
         WRITE( NOUT, FMT = 9967 )
      ELSE IF( GLM ) THEN
         WRITE( NOUT, FMT = 9971 )
      ELSE IF( GQR ) THEN
         WRITE( NOUT, FMT = 9970 )
      ELSE IF( GSV ) THEN
         WRITE( NOUT, FMT = 9969 )
      ELSE IF( LSE ) THEN
         WRITE( NOUT, FMT = 9968 )
      ELSE IF( DBL ) THEN
*
*        cdgebal:  Balancing
*
         CALL DCHKBL( NIN, NOUT )
         GO TO 10
      ELSE IF( DBK ) THEN
*
*        cdgebak:  Back transformation
*
         CALL DCHKBK( NIN, NOUT )
         GO TO 10
      ELSE IF( DGL ) THEN
*
*        cdggbal:  Balancing
*
         CALL DCHKGL( NIN, NOUT )
         GO TO 10
      ELSE IF( DGK ) THEN
*
*        cdggbak:  Back transformation
*
         CALL DCHKGK( NIN, NOUT )
         GO TO 10
      ELSE IF( LSAMEN( 3, PATH, 'DEC' ) ) THEN
*
*        DEC:  Eigencondition estimation
*
         READ( NIN, FMT = * )THRESH
         TSTERR = .TRUE.
         CALL DCHKEC( THRESH, TSTERR, NIN, NOUT )
         GO TO 10
      ELSE
         WRITE( NOUT, FMT = 9992 )PATH
         GO TO 10
      END IF
      WRITE( NOUT, FMT = 9972 )
      WRITE( NOUT, FMT = 9984 )
*
*     Read the number of values of M, P, and N.
*
      READ( NIN, FMT = * )NN
      IF( NN.LT.0 ) THEN
         WRITE( NOUT, FMT = 9989 )'   NN ', NN, 1
         NN = 0
         FATAL = .TRUE.
      ELSE IF( NN.GT.MAXIN ) THEN
         WRITE( NOUT, FMT = 9988 )'   NN ', NN, MAXIN
         NN = 0
         FATAL = .TRUE.
      END IF
*
*     Read the values of M
*
      IF( .NOT.( DGX .OR. DXV ) ) THEN
         READ( NIN, FMT = * )( MVAL( I ), I = 1, NN )
         IF( SVD ) THEN
            VNAME = '    M '
         ELSE
            VNAME = '    N '
         END IF
         DO 20 I = 1, NN
            IF( MVAL( I ).LT.0 ) THEN
               WRITE( NOUT, FMT = 9989 )VNAME, MVAL( I ), 0
               FATAL = .TRUE.
            ELSE IF( MVAL( I ).GT.NMAX ) THEN
               WRITE( NOUT, FMT = 9988 )VNAME, MVAL( I ), NMAX
               FATAL = .TRUE.
            END IF
   20    CONTINUE
         WRITE( NOUT, FMT = 9983 )'M:    ', ( MVAL( I ), I = 1, NN )
      END IF
*
*     Read the values of P
*
      IF( GLM .OR. GQR .OR. GSV .OR. LSE ) THEN
         READ( NIN, FMT = * )( PVAL( I ), I = 1, NN )
         DO 30 I = 1, NN
            IF( PVAL( I ).LT.0 ) THEN
               WRITE( NOUT, FMT = 9989 )' P  ', PVAL( I ), 0
               FATAL = .TRUE.
            ELSE IF( PVAL( I ).GT.NMAX ) THEN
               WRITE( NOUT, FMT = 9988 )' P  ', PVAL( I ), NMAX
               FATAL = .TRUE.
            END IF
   30    CONTINUE
         WRITE( NOUT, FMT = 9983 )'P:    ', ( PVAL( I ), I = 1, NN )
      END IF
*
*     Read the values of N
*
      IF( SVD .OR. DBB .OR. GLM .OR. GQR .OR. GSV .OR. LSE ) THEN
         READ( NIN, FMT = * )( NVAL( I ), I = 1, NN )
         DO 40 I = 1, NN
            IF( NVAL( I ).LT.0 ) THEN
               WRITE( NOUT, FMT = 9989 )'    N ', NVAL( I ), 0
               FATAL = .TRUE.
            ELSE IF( NVAL( I ).GT.NMAX ) THEN
               WRITE( NOUT, FMT = 9988 )'    N ', NVAL( I ), NMAX
               FATAL = .TRUE.
            END IF
   40    CONTINUE
      ELSE
         DO 50 I = 1, NN
            NVAL( I ) = MVAL( I )
   50    CONTINUE
      END IF
      IF( .NOT.( DGX .OR. DXV ) ) THEN
         WRITE( NOUT, FMT = 9983 )'N:    ', ( NVAL( I ), I = 1, NN )
      ELSE
         WRITE( NOUT, FMT = 9983 )'N:    ', NN
      END IF
*
*     Read the number of values of K, followed by the values of K
*
      IF( DSB .OR. DBB ) THEN
         READ( NIN, FMT = * )NK
         READ( NIN, FMT = * )( KVAL( I ), I = 1, NK )
         DO 60 I = 1, NK
            IF( KVAL( I ).LT.0 ) THEN
               WRITE( NOUT, FMT = 9989 )'    K ', KVAL( I ), 0
               FATAL = .TRUE.
            ELSE IF( KVAL( I ).GT.NMAX ) THEN
               WRITE( NOUT, FMT = 9988 )'    K ', KVAL( I ), NMAX
               FATAL = .TRUE.
            END IF
   60    CONTINUE
         WRITE( NOUT, FMT = 9983 )'K:    ', ( KVAL( I ), I = 1, NK )
      END IF
*
      IF( DEV .OR. DES .OR. DVX .OR. DSX .OR. DGS .OR. DGX .OR. DGV .OR.
     $    DXV ) THEN
*
*        For the nonsymmetric driver routines, only one set of
*        parameters is allowed.
*
         READ( NIN, FMT = * )NBVAL( 1 ), NBMIN( 1 ), NXVAL( 1 ),
     $      NSVAL( 1 ), MXBVAL( 1 )
         IF( NBVAL( 1 ).LT.1 ) THEN
            WRITE( NOUT, FMT = 9989 )'   NB ', NBVAL( 1 ), 1
            FATAL = .TRUE.
         ELSE IF( NBMIN( 1 ).LT.1 ) THEN
            WRITE( NOUT, FMT = 9989 )'NBMIN ', NBMIN( 1 ), 1
            FATAL = .TRUE.
         ELSE IF( NXVAL( 1 ).LT.1 ) THEN
            WRITE( NOUT, FMT = 9989 )'   NX ', NXVAL( 1 ), 1
            FATAL = .TRUE.
         ELSE IF( NSVAL( 1 ).LT.2 ) THEN
            WRITE( NOUT, FMT = 9989 )'   NS ', NSVAL( 1 ), 2
            FATAL = .TRUE.
         ELSE IF( MXBVAL( 1 ).LT.1 ) THEN
            WRITE( NOUT, FMT = 9989 )' MAXB ', MXBVAL( 1 ), 1
            FATAL = .TRUE.
         END IF
         CALL XLAENV( 1, NBVAL( 1 ) )
         CALL XLAENV( 2, NBMIN( 1 ) )
         CALL XLAENV( 3, NXVAL( 1 ) )
         CALL XLAENV( 4, NSVAL( 1 ) )
         CALL XLAENV( 8, MXBVAL( 1 ) )
         WRITE( NOUT, FMT = 9983 )'NB:   ', NBVAL( 1 )
         WRITE( NOUT, FMT = 9983 )'NBMIN:', NBMIN( 1 )
         WRITE( NOUT, FMT = 9983 )'NX:   ', NXVAL( 1 )
         WRITE( NOUT, FMT = 9983 )'NS:   ', NSVAL( 1 )
         WRITE( NOUT, FMT = 9983 )'MAXB: ', MXBVAL( 1 )
      ELSE IF( .NOT.DSB .AND. .NOT.GLM .AND. .NOT.GQR .AND. .NOT.
     $         GSV .AND. .NOT.LSE ) THEN
*
*        For the other paths, the number of parameters can be varied
*        from the input file.  Read the number of parameter values.
*
         READ( NIN, FMT = * )NPARMS
         IF( NPARMS.LT.1 ) THEN
            WRITE( NOUT, FMT = 9989 )'NPARMS', NPARMS, 1
            NPARMS = 0
            FATAL = .TRUE.
         ELSE IF( NPARMS.GT.MAXIN ) THEN
            WRITE( NOUT, FMT = 9988 )'NPARMS', NPARMS, MAXIN
            NPARMS = 0
            FATAL = .TRUE.
         END IF
*
*        Read the values of NB
*
         IF( .NOT.DBB ) THEN
            READ( NIN, FMT = * )( NBVAL( I ), I = 1, NPARMS )
            DO 70 I = 1, NPARMS
               IF( NBVAL( I ).LT.0 ) THEN
                  WRITE( NOUT, FMT = 9989 )'   NB ', NBVAL( I ), 0
                  FATAL = .TRUE.
               ELSE IF( NBVAL( I ).GT.NMAX ) THEN
                  WRITE( NOUT, FMT = 9988 )'   NB ', NBVAL( I ), NMAX
                  FATAL = .TRUE.
               END IF
   70       CONTINUE
            WRITE( NOUT, FMT = 9983 )'NB:   ',
     $         ( NBVAL( I ), I = 1, NPARMS )
         END IF
*
*        Read the values of NBMIN
*
         IF( NEP .OR. SEP .OR. SVD .OR. DGG ) THEN
            READ( NIN, FMT = * )( NBMIN( I ), I = 1, NPARMS )
            DO 80 I = 1, NPARMS
               IF( NBMIN( I ).LT.0 ) THEN
                  WRITE( NOUT, FMT = 9989 )'NBMIN ', NBMIN( I ), 0
                  FATAL = .TRUE.
               ELSE IF( NBMIN( I ).GT.NMAX ) THEN
                  WRITE( NOUT, FMT = 9988 )'NBMIN ', NBMIN( I ), NMAX
                  FATAL = .TRUE.
               END IF
   80       CONTINUE
            WRITE( NOUT, FMT = 9983 )'NBMIN:',
     $         ( NBMIN( I ), I = 1, NPARMS )
         ELSE
            DO 90 I = 1, NPARMS
               NBMIN( I ) = 1
   90       CONTINUE
         END IF
*
*        Read the values of NX
*
         IF( NEP .OR. SEP .OR. SVD ) THEN
            READ( NIN, FMT = * )( NXVAL( I ), I = 1, NPARMS )
            DO 100 I = 1, NPARMS
               IF( NXVAL( I ).LT.0 ) THEN
                  WRITE( NOUT, FMT = 9989 )'   NX ', NXVAL( I ), 0
                  FATAL = .TRUE.
               ELSE IF( NXVAL( I ).GT.NMAX ) THEN
                  WRITE( NOUT, FMT = 9988 )'   NX ', NXVAL( I ), NMAX
                  FATAL = .TRUE.
               END IF
  100       CONTINUE
            WRITE( NOUT, FMT = 9983 )'NX:   ',
     $         ( NXVAL( I ), I = 1, NPARMS )
         ELSE
            DO 110 I = 1, NPARMS
               NXVAL( I ) = 1
  110       CONTINUE
         END IF
*
*        Read the values of NSHIFT (if NEP or DGG) or NRHS (if SVD
*        or DBB).
*
         IF( NEP .OR. SVD .OR. DBB .OR. DGG ) THEN
            READ( NIN, FMT = * )( NSVAL( I ), I = 1, NPARMS )
            DO 120 I = 1, NPARMS
               IF( NSVAL( I ).LT.0 ) THEN
                  WRITE( NOUT, FMT = 9989 )'   NS ', NSVAL( I ), 0
                  FATAL = .TRUE.
               ELSE IF( NSVAL( I ).GT.NMAX ) THEN
                  WRITE( NOUT, FMT = 9988 )'   NS ', NSVAL( I ), NMAX
                  FATAL = .TRUE.
               END IF
  120       CONTINUE
            WRITE( NOUT, FMT = 9983 )'NS:   ',
     $         ( NSVAL( I ), I = 1, NPARMS )
         ELSE
            DO 130 I = 1, NPARMS
               NSVAL( I ) = 1
  130       CONTINUE
         END IF
*
*        Read the values for MAXB.
*
         IF( NEP .OR. DGG ) THEN
            READ( NIN, FMT = * )( MXBVAL( I ), I = 1, NPARMS )
            DO 140 I = 1, NPARMS
               IF( MXBVAL( I ).LT.0 ) THEN
                  WRITE( NOUT, FMT = 9989 )' MAXB ', MXBVAL( I ), 0
                  FATAL = .TRUE.
               ELSE IF( MXBVAL( I ).GT.NMAX ) THEN
                  WRITE( NOUT, FMT = 9988 )' MAXB ', MXBVAL( I ), NMAX
                  FATAL = .TRUE.
               END IF
  140       CONTINUE
            WRITE( NOUT, FMT = 9983 )'MAXB: ',
     $         ( MXBVAL( I ), I = 1, NPARMS )
         ELSE
            DO 150 I = 1, NPARMS
               MXBVAL( I ) = 1
  150       CONTINUE
         END IF
*
*        Read the values for NBCOL.
*
         IF( DGG ) THEN
            READ( NIN, FMT = * )( NBCOL( I ), I = 1, NPARMS )
            DO 160 I = 1, NPARMS
               IF( NBCOL( I ).LT.0 ) THEN
                  WRITE( NOUT, FMT = 9989 )'NBCOL ', NBCOL( I ), 0
                  FATAL = .TRUE.
               ELSE IF( NBCOL( I ).GT.NMAX ) THEN
                  WRITE( NOUT, FMT = 9988 )'NBCOL ', NBCOL( I ), NMAX
                  FATAL = .TRUE.
               END IF
  160       CONTINUE
            WRITE( NOUT, FMT = 9983 )'NBCOL:',
     $         ( NBCOL( I ), I = 1, NPARMS )
         ELSE
            DO 170 I = 1, NPARMS
               NBCOL( I ) = 1
  170       CONTINUE
         END IF
      END IF
*
*     Calculate and print the machine dependent constants.
*
      WRITE( NOUT, FMT = * )
      EPS = DLAMCH( 'Underflow threshold' )
      WRITE( NOUT, FMT = 9981 )'underflow', EPS
      EPS = DLAMCH( 'Overflow threshold' )
      WRITE( NOUT, FMT = 9981 )'overflow ', EPS
      EPS = DLAMCH( 'Epsilon' )
      WRITE( NOUT, FMT = 9981 )'precision', EPS
*
*     Read the threshold value for the test ratios.
*
      READ( NIN, FMT = * )THRESH
      WRITE( NOUT, FMT = 9982 )THRESH
      IF( SEP .OR. SVD .OR. DGG ) THEN
*
*        Read the flag that indicates whether to test LAPACK routines.
*
         READ( NIN, FMT = * )TSTCHK
*
*        Read the flag that indicates whether to test driver routines.
*
         READ( NIN, FMT = * )TSTDRV
      END IF
*
*     Read the flag that indicates whether to test the error exits.
*
      READ( NIN, FMT = * )TSTERR
*
*     Read the code describing how to set the random number seed.
*
      READ( NIN, FMT = * )NEWSD
*
*     If NEWSD = 2, read another line with 4 integers for the seed.
*
      IF( NEWSD.EQ.2 )
     $   READ( NIN, FMT = * )( IOLDSD( I ), I = 1, 4 )
*
      DO 180 I = 1, 4
         ISEED( I ) = IOLDSD( I )
  180 CONTINUE
*
      IF( FATAL ) THEN
         WRITE( NOUT, FMT = 9999 )
         STOP
      END IF
*
*     Read the input lines indicating the test path and its parameters.
*     The first three characters indicate the test path, and the number
*     of test matrix types must be the first nonblank item in columns
*     4-80.
*
  190 CONTINUE
*
      IF( .NOT.( DGX .OR. DXV ) ) THEN
*
  200    CONTINUE
         READ( NIN, FMT = '(A80)', END = 380 )LINE
         C3 = LINE( 1: 3 )
         LENP = LEN( LINE )
         I = 3
         ITMP = 0
         I1 = 0
  210    CONTINUE
         I = I + 1
         IF( I.GT.LENP ) THEN
            IF( I1.GT.0 ) THEN
               GO TO 240
            ELSE
               NTYPES = MAXT
               GO TO 240
            END IF
         END IF
         IF( LINE( I: I ).NE.' ' .AND. LINE( I: I ).NE.',' ) THEN
            I1 = I
            C1 = LINE( I1: I1 )
*
*        Check that a valid integer was read
*
            DO 220 K = 1, 10
               IF( C1.EQ.INTSTR( K: K ) ) THEN
                  IC = K - 1
                  GO TO 230
               END IF
  220       CONTINUE
            WRITE( NOUT, FMT = 9991 )I, LINE
            GO TO 200
  230       CONTINUE
            ITMP = 10*ITMP + IC
            GO TO 210
         ELSE IF( I1.GT.0 ) THEN
            GO TO 240
         ELSE
            GO TO 210
         END IF
  240    CONTINUE
         NTYPES = ITMP
*
*     Skip the tests if NTYPES is <= 0.
*
         IF( .NOT.( DEV .OR. DES .OR. DVX .OR. DSX .OR. DGV .OR.
     $       DGS ) .AND. NTYPES.LE.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
            GO TO 200
         END IF
*
      ELSE
         IF( DXV )
     $      C3 = 'DXV'
         IF( DGX )
     $      C3 = 'DGX'
      END IF
*
*     Reset the random number seed.
*
      IF( NEWSD.EQ.0 ) THEN
         DO 250 K = 1, 4
            ISEED( K ) = IOLDSD( K )
  250    CONTINUE
      END IF
*
      IF( LSAMEN( 3, C3, 'DHS' ) .OR. LSAMEN( 3, C3, 'NEP' ) ) THEN
*
*        -------------------------------------
*        NEP:  Nonsymmetric Eigenvalue Problem
*        -------------------------------------
*        Vary the parameters
*           NB    = block size
*           NBMIN = minimum block size
*           NX    = crossover point
*           NS    = number of shifts
*           MAXB  = minimum submatrix size
*
         MAXTYP = 21
         NTYPES = MIN( MAXTYP, NTYPES )
         CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
         IF( TSTERR )
     $      CALL DERRHS( 'cdhseqr', NOUT )
         DO 270 I = 1, NPARMS
            CALL XLAENV( 1, NBVAL( I ) )
            CALL XLAENV( 2, NBMIN( I ) )
            CALL XLAENV( 3, NXVAL( I ) )
            CALL XLAENV( 4, NSVAL( I ) )
            CALL XLAENV( 8, MXBVAL( I ) )
*
            IF( NEWSD.EQ.0 ) THEN
               DO 260 K = 1, 4
                  ISEED( K ) = IOLDSD( K )
  260          CONTINUE
            END IF
            WRITE( NOUT, FMT = 9998 )C3, NBVAL( I ), NBMIN( I ),
     $         NXVAL( I ), NSVAL( I ), MXBVAL( I )
            CALL DCHKHS( NN, NVAL, MAXTYP, DOTYPE, ISEED, THRESH, NOUT,
     $                   A( 1, 1 ), NMAX, A( 1, 2 ), A( 1, 3 ),
     $                   A( 1, 4 ), A( 1, 5 ), NMAX, A( 1, 6 ),
     $                   A( 1, 7 ), D( 1, 1 ), D( 1, 2 ), D( 1, 3 ),
     $                   D( 1, 4 ), A( 1, 8 ), A( 1, 9 ), A( 1, 10 ),
     $                   A( 1, 11 ), A( 1, 12 ), D( 1, 5 ), WORK, LWORK,
     $                   IWORK, LOGWRK, RESULT, INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'DCHKHS', INFO
  270    CONTINUE
*
      ELSE IF( LSAMEN( 3, C3, 'DST' ) .OR. LSAMEN( 3, C3, 'SEP' ) ) THEN
*
*        ----------------------------------
*        SEP:  Symmetric Eigenvalue Problem
*        ----------------------------------
*        Vary the parameters
*           NB    = block size
*           NBMIN = minimum block size
*           NX    = crossover point
*
         MAXTYP = 21
         NTYPES = MIN( MAXTYP, NTYPES )
         CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
         CALL XLAENV( 9, 25 )
         IF( TSTERR )
     $      CALL DERRST( 'DST', NOUT )
         DO 290 I = 1, NPARMS
            CALL XLAENV( 1, NBVAL( I ) )
            CALL XLAENV( 2, NBMIN( I ) )
            CALL XLAENV( 3, NXVAL( I ) )
*
            IF( NEWSD.EQ.0 ) THEN
               DO 280 K = 1, 4
                  ISEED( K ) = IOLDSD( K )
  280          CONTINUE
            END IF
            WRITE( NOUT, FMT = 9997 )C3, NBVAL( I ), NBMIN( I ),
     $         NXVAL( I )
            IF( TSTCHK ) THEN
               CALL DCHKST( NN, NVAL, MAXTYP, DOTYPE, ISEED, THRESH,
     $                      NOUT, A( 1, 1 ), NMAX, A( 1, 2 ), D( 1, 1 ),
     $                      D( 1, 2 ), D( 1, 3 ), D( 1, 4 ), D( 1, 5 ),
     $                      D( 1, 6 ), D( 1, 7 ), D( 1, 8 ), D( 1, 9 ),
     $                      D( 1, 10 ), D( 1, 11 ), A( 1, 3 ), NMAX,
     $                      A( 1, 4 ), A( 1, 5 ), D( 1, 12 ), A( 1, 6 ),
     $                      WORK, LWORK, IWORK, LIWORK, RESULT, INFO )
               IF( INFO.NE.0 )
     $            WRITE( NOUT, FMT = 9980 )'DCHKST', INFO
            END IF
            IF( TSTDRV ) THEN
               CALL DDRVST( NN, NVAL, 18, DOTYPE, ISEED, THRESH, NOUT,
     $                      A( 1, 1 ), NMAX, D( 1, 3 ), D( 1, 4 ),
     $                      D( 1, 5 ), D( 1, 6 ), D( 1, 8 ), D( 1, 9 ),
     $                      D( 1, 10 ), D( 1, 11 ), A( 1, 2 ), NMAX,
     $                      A( 1, 3 ), D( 1, 12 ), A( 1, 4 ), WORK,
     $                      LWORK, IWORK, LIWORK, RESULT, INFO )
               IF( INFO.NE.0 )
     $            WRITE( NOUT, FMT = 9980 )'DDRVST', INFO
            END IF
  290    CONTINUE
*
      ELSE IF( LSAMEN( 3, C3, 'DSG' ) ) THEN
*
*        ----------------------------------------------
*        DSG:  Symmetric Generalized Eigenvalue Problem
*        ----------------------------------------------
*        Vary the parameters
*           NB    = block size
*           NBMIN = minimum block size
*           NX    = crossover point
*
         MAXTYP = 21
         NTYPES = MIN( MAXTYP, NTYPES )
         CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
         CALL XLAENV( 9, 25 )
         DO 310 I = 1, NPARMS
            CALL XLAENV( 1, NBVAL( I ) )
            CALL XLAENV( 2, NBMIN( I ) )
            CALL XLAENV( 3, NXVAL( I ) )
*
            IF( NEWSD.EQ.0 ) THEN
               DO 300 K = 1, 4
                  ISEED( K ) = IOLDSD( K )
  300          CONTINUE
            END IF
            WRITE( NOUT, FMT = 9997 )C3, NBVAL( I ), NBMIN( I ),
     $         NXVAL( I )
            IF( TSTCHK ) THEN
               CALL DDRVSG( NN, NVAL, MAXTYP, DOTYPE, ISEED, THRESH,
     $                      NOUT, A( 1, 1 ), NMAX, A( 1, 2 ), NMAX,
     $                      D( 1, 3 ), A( 1, 3 ), NMAX, A( 1, 4 ),
     $                      A( 1, 5 ), A( 1, 6 ), A( 1, 7 ), WORK,
     $                      LWORK, IWORK, LIWORK, RESULT, INFO )
               IF( INFO.NE.0 )
     $            WRITE( NOUT, FMT = 9980 )'DDRVSG', INFO
            END IF
  310    CONTINUE
*
      ELSE IF( LSAMEN( 3, C3, 'DBD' ) .OR. LSAMEN( 3, C3, 'SVD' ) ) THEN
*
*        ----------------------------------
*        SVD:  Singular Value Decomposition
*        ----------------------------------
*        Vary the parameters
*           NB    = block size
*           NBMIN = minimum block size
*           NX    = crossover point
*           NRHS  = number of right hand sides
*
         MAXTYP = 16
         NTYPES = MIN( MAXTYP, NTYPES )
         CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
         CALL XLAENV( 9, 25 )
*
*        Test the error exits
*
         IF( TSTERR .AND. TSTCHK )
     $      CALL DERRBD( 'DBD', NOUT )
         IF( TSTERR .AND. TSTDRV )
     $      CALL DERRED( 'DBD', NOUT )
*
         DO 330 I = 1, NPARMS
            NRHS = NSVAL( I )
            CALL XLAENV( 1, NBVAL( I ) )
            CALL XLAENV( 2, NBMIN( I ) )
            CALL XLAENV( 3, NXVAL( I ) )
            IF( NEWSD.EQ.0 ) THEN
               DO 320 K = 1, 4
                  ISEED( K ) = IOLDSD( K )
  320          CONTINUE
            END IF
            WRITE( NOUT, FMT = 9995 )C3, NBVAL( I ), NBMIN( I ),
     $         NXVAL( I ), NRHS
            IF( TSTCHK ) THEN
               CALL DCHKBD( NN, MVAL, NVAL, MAXTYP, DOTYPE, NRHS, ISEED,
     $                      THRESH, A( 1, 1 ), NMAX, D( 1, 1 ),
     $                      D( 1, 2 ), D( 1, 3 ), D( 1, 4 ), A( 1, 2 ),
     $                      NMAX, A( 1, 3 ), A( 1, 4 ), A( 1, 5 ), NMAX,
     $                      A( 1, 6 ), NMAX, A( 1, 7 ), A( 1, 8 ), WORK,
     $                      LWORK, IWORK, NOUT, INFO )
               IF( INFO.NE.0 )
     $            WRITE( NOUT, FMT = 9980 )'DCHKBD', INFO
            END IF
            IF( TSTDRV )
     $         CALL DDRVBD( NN, MVAL, NVAL, MAXTYP, DOTYPE, ISEED,
     $                      THRESH, A( 1, 1 ), NMAX, A( 1, 2 ), NMAX,
     $                      A( 1, 3 ), NMAX, A( 1, 4 ), A( 1, 5 ),
     $                      A( 1, 6 ), D( 1, 1 ), D( 1, 2 ), D( 1, 3 ),
     $                      WORK, LWORK, IWORK, NOUT, INFO )
  330    CONTINUE
*
      ELSE IF( LSAMEN( 3, C3, 'DEV' ) ) THEN
*
*        --------------------------------------------
*        DEV:  Nonsymmetric Eigenvalue Problem Driver
*              cdgeev (eigenvalues and eigenvectors)
*        --------------------------------------------
*
         MAXTYP = 21
         NTYPES = MIN( MAXTYP, NTYPES )
         IF( NTYPES.LE.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRED( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRVEV( NN, NVAL, NTYPES, DOTYPE, ISEED, THRESH, NOUT,
     $                   A( 1, 1 ), NMAX, A( 1, 2 ), D( 1, 1 ),
     $                   D( 1, 2 ), D( 1, 3 ), D( 1, 4 ), A( 1, 3 ),
     $                   NMAX, A( 1, 4 ), NMAX, A( 1, 5 ), NMAX, RESULT,
     $                   WORK, LWORK, IWORK, INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'cdgeev', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( LSAMEN( 3, C3, 'DES' ) ) THEN
*
*        --------------------------------------------
*        DES:  Nonsymmetric Eigenvalue Problem Driver
*              cdgees (Schur form)
*        --------------------------------------------
*
         MAXTYP = 21
         NTYPES = MIN( MAXTYP, NTYPES )
         IF( NTYPES.LE.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRED( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRVES( NN, NVAL, NTYPES, DOTYPE, ISEED, THRESH, NOUT,
     $                   A( 1, 1 ), NMAX, A( 1, 2 ), A( 1, 3 ),
     $                   D( 1, 1 ), D( 1, 2 ), D( 1, 3 ), D( 1, 4 ),
     $                   A( 1, 4 ), NMAX, RESULT, WORK, LWORK, IWORK,
     $                   LOGWRK, INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'cdgees', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( LSAMEN( 3, C3, 'DVX' ) ) THEN
*
*        --------------------------------------------------------------
*        DVX:  Nonsymmetric Eigenvalue Problem Expert Driver
*              cdgeevX (eigenvalues, eigenvectors and condition numbers)
*        --------------------------------------------------------------
*
         MAXTYP = 21
         NTYPES = MIN( MAXTYP, NTYPES )
         IF( NTYPES.LT.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRED( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRVVX( NN, NVAL, NTYPES, DOTYPE, ISEED, THRESH, NIN,
     $                   NOUT, A( 1, 1 ), NMAX, A( 1, 2 ), D( 1, 1 ),
     $                   D( 1, 2 ), D( 1, 3 ), D( 1, 4 ), A( 1, 3 ),
     $                   NMAX, A( 1, 4 ), NMAX, A( 1, 5 ), NMAX,
     $                   D( 1, 5 ), D( 1, 6 ), D( 1, 7 ), D( 1, 8 ),
     $                   D( 1, 9 ), D( 1, 10 ), D( 1, 11 ), D( 1, 12 ),
     $                   RESULT, WORK, LWORK, IWORK, INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'cdgeevX', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( LSAMEN( 3, C3, 'DSX' ) ) THEN
*
*        ---------------------------------------------------
*        DSX:  Nonsymmetric Eigenvalue Problem Expert Driver
*              cdgeesX (Schur form and condition numbers)
*        ---------------------------------------------------
*
         MAXTYP = 21
         NTYPES = MIN( MAXTYP, NTYPES )
         IF( NTYPES.LT.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRED( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRVSX( NN, NVAL, NTYPES, DOTYPE, ISEED, THRESH, NIN,
     $                   NOUT, A( 1, 1 ), NMAX, A( 1, 2 ), A( 1, 3 ),
     $                   D( 1, 1 ), D( 1, 2 ), D( 1, 3 ), D( 1, 4 ),
     $                   D( 1, 5 ), D( 1, 6 ), A( 1, 4 ), NMAX,
     $                   A( 1, 5 ), RESULT, WORK, LWORK, IWORK, LOGWRK,
     $                   INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'cdgeesX', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( LSAMEN( 3, C3, 'DGG' ) ) THEN
*
*        -------------------------------------------------
*        DGG:  Generalized Nonsymmetric Eigenvalue Problem
*        -------------------------------------------------
*        Vary the parameters
*           NB    = block size
*           NBMIN = minimum block size
*           NS    = number of shifts
*           MAXB  = minimum submatrix size
*           NBCOL = minimum column dimension for blocks
*
         MAXTYP = 26
         NTYPES = MIN( MAXTYP, NTYPES )
         CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
         IF( TSTCHK .AND. TSTERR )
     $      CALL DERRGG( C3, NOUT )
         DO 350 I = 1, NPARMS
            CALL XLAENV( 1, NBVAL( I ) )
            CALL XLAENV( 2, NBMIN( I ) )
            CALL XLAENV( 4, NSVAL( I ) )
            CALL XLAENV( 8, MXBVAL( I ) )
            CALL XLAENV( 5, NBCOL( I ) )
*
            IF( NEWSD.EQ.0 ) THEN
               DO 340 K = 1, 4
                  ISEED( K ) = IOLDSD( K )
  340          CONTINUE
            END IF
            WRITE( NOUT, FMT = 9996 )C3, NBVAL( I ), NBMIN( I ),
     $         NSVAL( I ), MXBVAL( I ), NBCOL( I )
            TSTDIF = .FALSE.
            THRSHN = 10.D0
            IF( TSTCHK ) THEN
               CALL DCHKGG( NN, NVAL, MAXTYP, DOTYPE, ISEED, THRESH,
     $                      TSTDIF, THRSHN, NOUT, A( 1, 1 ), NMAX,
     $                      A( 1, 2 ), A( 1, 3 ), A( 1, 4 ), A( 1, 5 ),
     $                      A( 1, 6 ), A( 1, 7 ), A( 1, 8 ), A( 1, 9 ),
     $                      NMAX, A( 1, 10 ), A( 1, 11 ), A( 1, 12 ),
     $                      D( 1, 1 ), D( 1, 2 ), D( 1, 3 ), D( 1, 4 ),
     $                      D( 1, 5 ), D( 1, 6 ), A( 1, 13 ),
     $                      A( 1, 14 ), WORK, LWORK, LOGWRK, RESULT,
     $                      INFO )
               IF( INFO.NE.0 )
     $            WRITE( NOUT, FMT = 9980 )'DCHKGG', INFO
            END IF
            IF( TSTDRV ) THEN
               CALL DDRVGG( NN, NVAL, MAXTYP, DOTYPE, ISEED, THRESH,
     $                      THRSHN, NOUT, A( 1, 1 ), NMAX, A( 1, 2 ),
     $                      A( 1, 3 ), A( 1, 4 ), A( 1, 5 ), A( 1, 6 ),
     $                      A( 1, 7 ), NMAX, A( 1, 8 ), D( 1, 1 ),
     $                      D( 1, 2 ), D( 1, 3 ), D( 1, 4 ), D( 1, 5 ),
     $                      D( 1, 6 ), A( 1, 13 ), A( 1, 14 ), WORK,
     $                      LWORK, RESULT, INFO )
               IF( INFO.NE.0 )
     $            WRITE( NOUT, FMT = 9980 )'DDRVGG', INFO
            END IF
  350    CONTINUE
*
      ELSE IF( LSAMEN( 3, C3, 'DGS' ) ) THEN
*
*        -------------------------------------------------
*        DGS:  Generalized Nonsymmetric Eigenvalue Problem
*              cdgges (Schur form)
*        -------------------------------------------------
*
         MAXTYP = 26
         NTYPES = MIN( MAXTYP, NTYPES )
         IF( NTYPES.LE.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRGG( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRGES( NN, NVAL, MAXTYP, DOTYPE, ISEED, THRESH, NOUT,
     $                   A( 1, 1 ), NMAX, A( 1, 2 ), A( 1, 3 ),
     $                   A( 1, 4 ), A( 1, 7 ), NMAX, A( 1, 8 ),
     $                   D( 1, 1 ), D( 1, 2 ), D( 1, 3 ), WORK, LWORK,
     $                   RESULT, LOGWRK, INFO )
*
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'DDRGES', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( DGX ) THEN
*
*        -------------------------------------------------
*        DGX:  Generalized Nonsymmetric Eigenvalue Problem
*              cdggesX (Schur form and condition numbers)
*        -------------------------------------------------
*
         MAXTYP = 5
         NTYPES = MAXTYP
         IF( NN.LT.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRGG( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRGSX( NN, NCMAX, THRESH, NIN, NOUT, A( 1, 1 ), NMAX,
     $                   A( 1, 2 ), A( 1, 3 ), A( 1, 4 ), A( 1, 5 ),
     $                   A( 1, 6 ), D( 1, 1 ), D( 1, 2 ), D( 1, 3 ),
     $                   C( 1, 1 ), NCMAX*NCMAX, A( 1, 12 ), WORK,
     $                   LWORK, IWORK, LIWORK, LOGWRK, INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'DDRGSX', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( LSAMEN( 3, C3, 'DGV' ) ) THEN
*
*        -------------------------------------------------
*        DGV:  Generalized Nonsymmetric Eigenvalue Problem
*              cdggev (Eigenvalue/vector form)
*        -------------------------------------------------
*
         MAXTYP = 26
         NTYPES = MIN( MAXTYP, NTYPES )
         IF( NTYPES.LE.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRGG( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRGEV( NN, NVAL, MAXTYP, DOTYPE, ISEED, THRESH, NOUT,
     $                   A( 1, 1 ), NMAX, A( 1, 2 ), A( 1, 3 ),
     $                   A( 1, 4 ), A( 1, 7 ), NMAX, A( 1, 8 ),
     $                   A( 1, 9 ), NMAX, D( 1, 1 ), D( 1, 2 ),
     $                   D( 1, 3 ), D( 1, 4 ), D( 1, 5 ), D( 1, 6 ),
     $                   WORK, LWORK, RESULT, INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'DDRGEV', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( DXV ) THEN
*
*        -------------------------------------------------
*        DXV:  Generalized Nonsymmetric Eigenvalue Problem
*              cdggevX (eigenvalue/vector with condition numbers)
*        -------------------------------------------------
*
         MAXTYP = 2
         NTYPES = MAXTYP
         IF( NN.LT.0 ) THEN
            WRITE( NOUT, FMT = 9990 )C3
         ELSE
            IF( TSTERR )
     $         CALL DERRGG( C3, NOUT )
            CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
            CALL DDRGVX( NN, THRESH, NIN, NOUT, A( 1, 1 ), NMAX,
     $                   A( 1, 2 ), A( 1, 3 ), A( 1, 4 ), D( 1, 1 ),
     $                   D( 1, 2 ), D( 1, 3 ), A( 1, 5 ), A( 1, 6 ),
     $                   IWORK( 1 ), IWORK( 2 ), D( 1, 4 ), D( 1, 5 ),
     $                   D( 1, 6 ), D( 1, 7 ), D( 1, 8 ), D( 1, 9 ),
     $                   WORK, LWORK, IWORK( 3 ), LIWORK-2, RESULT,
     $                   LOGWRK, INFO )
*
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'DDRGVX', INFO
         END IF
         WRITE( NOUT, FMT = 9973 )
         GO TO 10
*
      ELSE IF( LSAMEN( 3, C3, 'DSB' ) ) THEN
*
*        ------------------------------
*        DSB:  Symmetric Band Reduction
*        ------------------------------
*
         MAXTYP = 15
         NTYPES = MIN( MAXTYP, NTYPES )
         CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
         IF( TSTERR )
     $      CALL DERRST( 'DSB', NOUT )
         CALL DCHKSB( NN, NVAL, NK, KVAL, MAXTYP, DOTYPE, ISEED, THRESH,
     $                NOUT, A( 1, 1 ), NMAX, D( 1, 1 ), D( 1, 2 ),
     $                A( 1, 2 ), NMAX, WORK, LWORK, RESULT, INFO )
         IF( INFO.NE.0 )
     $      WRITE( NOUT, FMT = 9980 )'DCHKSB', INFO
*
      ELSE IF( LSAMEN( 3, C3, 'DBB' ) ) THEN
*
*        ------------------------------
*        DBB:  General Band Reduction
*        ------------------------------
*
         MAXTYP = 15
         NTYPES = MIN( MAXTYP, NTYPES )
         CALL ALAREQ( C3, NTYPES, DOTYPE, MAXTYP, NIN, NOUT )
         DO 370 I = 1, NPARMS
            NRHS = NSVAL( I )
*
            IF( NEWSD.EQ.0 ) THEN
               DO 360 K = 1, 4
                  ISEED( K ) = IOLDSD( K )
  360          CONTINUE
            END IF
            WRITE( NOUT, FMT = 9966 )C3, NRHS
            CALL DCHKBB( NN, MVAL, NVAL, NK, KVAL, MAXTYP, DOTYPE, NRHS,
     $                   ISEED, THRESH, NOUT, A( 1, 1 ), NMAX,
     $                   A( 1, 2 ), 2*NMAX, D( 1, 1 ), D( 1, 2 ),
     $                   A( 1, 4 ), NMAX, A( 1, 5 ), NMAX, A( 1, 6 ),
     $                   NMAX, A( 1, 7 ), WORK, LWORK, RESULT, INFO )
            IF( INFO.NE.0 )
     $         WRITE( NOUT, FMT = 9980 )'DCHKBB', INFO
  370    CONTINUE
*
      ELSE IF( LSAMEN( 3, C3, 'GLM' ) ) THEN
*
*        -----------------------------------------
*        GLM:  Generalized Linear Regression Model
*        -----------------------------------------
*
         IF( TSTERR )
     $      CALL DERRGG( 'GLM', NOUT )
         CALL DCKGLM( NN, MVAL, PVAL, NVAL, NTYPES, ISEED, THRESH, NMAX,
     $                A( 1, 1 ), A( 1, 2 ), B( 1, 1 ), B( 1, 2 ), X,
     $                WORK, D( 1, 1 ), NIN, NOUT, INFO )
         IF( INFO.NE.0 )
     $      WRITE( NOUT, FMT = 9980 )'DCKGLM', INFO
*
      ELSE IF( LSAMEN( 3, C3, 'GQR' ) ) THEN
*
*        ------------------------------------------
*        GQR:  Generalized QR and RQ factorizations
*        ------------------------------------------
*
         IF( TSTERR )
     $      CALL DERRGG( 'GQR', NOUT )
         CALL DCKGQR( NN, MVAL, NN, PVAL, NN, NVAL, NTYPES, ISEED,
     $                THRESH, NMAX, A( 1, 1 ), A( 1, 2 ), A( 1, 3 ),
     $                A( 1, 4 ), TAUA, B( 1, 1 ), B( 1, 2 ), B( 1, 3 ),
     $                B( 1, 4 ), B( 1, 5 ), TAUB, WORK, D( 1, 1 ), NIN,
     $                NOUT, INFO )
         IF( INFO.NE.0 )
     $      WRITE( NOUT, FMT = 9980 )'DCKGQR', INFO
*
      ELSE IF( LSAMEN( 3, C3, 'GSV' ) ) THEN
*
*        ----------------------------------------------
*        GSV:  Generalized Singular Value Decomposition
*        ----------------------------------------------
*
         IF( TSTERR )
     $      CALL DERRGG( 'GSV', NOUT )
         CALL DCKGSV( NN, MVAL, PVAL, NVAL, NTYPES, ISEED, THRESH, NMAX,
     $                A( 1, 1 ), A( 1, 2 ), B( 1, 1 ), B( 1, 2 ),
     $                A( 1, 3 ), B( 1, 3 ), A( 1, 4 ), TAUA, TAUB,
     $                B( 1, 4 ), IWORK, WORK, D( 1, 1 ), NIN, NOUT,
     $                INFO )
         IF( INFO.NE.0 )
     $      WRITE( NOUT, FMT = 9980 )'DCKGSV', INFO
*
      ELSE IF( LSAMEN( 3, C3, 'LSE' ) ) THEN
*
*        --------------------------------------
*        LSE:  Constrained Linear Least Squares
*        --------------------------------------
*
         IF( TSTERR )
     $      CALL DERRGG( 'LSE', NOUT )
         CALL DCKLSE( NN, MVAL, PVAL, NVAL, NTYPES, ISEED, THRESH, NMAX,
     $                A( 1, 1 ), A( 1, 2 ), B( 1, 1 ), B( 1, 2 ), X,
     $                WORK, D( 1, 1 ), NIN, NOUT, INFO )
         IF( INFO.NE.0 )
     $      WRITE( NOUT, FMT = 9980 )'DCKLSE', INFO
*
      ELSE
         WRITE( NOUT, FMT = * )
         WRITE( NOUT, FMT = * )
         WRITE( NOUT, FMT = 9992 )C3
      END IF
      IF( .NOT.( DGX .OR. DXV ) )
     $   GO TO 190
  380 CONTINUE
      WRITE( NOUT, FMT = 9994 )
      S2 = DSECND( )
      WRITE( NOUT, FMT = 9993 )S2 - S1
*
 9999 FORMAT( / ' Execution not attempted due to input errors' )
 9998 FORMAT( / / 1X, A3, ':  NB =', I4, ', NBMIN =', I4, ', NX =', I4,
     $      ', NS =', I4, ', MAXB =', I4 )
 9997 FORMAT( / / 1X, A3, ':  NB =', I4, ', NBMIN =', I4, ', NX =', I4 )
 9996 FORMAT( / / 1X, A3, ':  NB =', I4, ', NBMIN =', I4, ', NS =', I4,
     $      ', MAXB =', I4, ', NBCOL =', I4 )
 9995 FORMAT( / / 1X, A3, ':  NB =', I4, ', NBMIN =', I4, ', NX =', I4,
     $      ', NRHS =', I4 )
 9994 FORMAT( / / ' End of tests' )
 9993 FORMAT( ' Total time used = ', F12.2, ' seconds', / )
 9992 FORMAT( 1X, A3, ':  Unrecognized path name' )
 9991 FORMAT( / / ' *** Invalid integer value in column ', I2,
     $      ' of input', ' line:', / A79 )
 9990 FORMAT( / / 1X, A3, ' routines were not tested' )
 9989 FORMAT( ' Invalid input value: ', A6, '=', I6, '; must be >=',
     $      I6 )
 9988 FORMAT( ' Invalid input value: ', A6, '=', I6, '; must be <=',
     $      I6 )
 9987 FORMAT( ' Tests of the Nonsymmetric Eigenvalue Problem routines' )
 9986 FORMAT( ' Tests of the Symmetric Eigenvalue Problem routines' )
 9985 FORMAT( ' Tests of the Singular Value Decomposition routines' )
 9984 FORMAT( / ' The following parameter values will be used:' )
 9983 FORMAT( 4X, A6, 10I6, / 10X, 10I6 )
 9982 FORMAT( / ' Routines pass computational tests if test ratio is ',
     $      'less than', F8.2, / )
 9981 FORMAT( ' Relative machine ', A, ' is taken to be', D16.6 )
 9980 FORMAT( ' *** Error code from ', A6, ' = ', I4 )
 9979 FORMAT( / ' Tests of the Nonsymmetric Eigenvalue Problem Driver',
     $      / '    cdgeev (eigenvalues and eigevectors)' )
 9978 FORMAT( / ' Tests of the Nonsymmetric Eigenvalue Problem Driver',
     $      / '    cdgees (Schur form)' )
 9977 FORMAT( / ' Tests of the Nonsymmetric Eigenvalue Problem Expert',
     $      ' Driver', / '    cdgeevX (eigenvalues, eigenvectors and',
     $      ' condition numbers)' )
 9976 FORMAT( / ' Tests of the Nonsymmetric Eigenvalue Problem Expert',
     $      ' Driver', / '    cdgeesX (Schur form and condition',
     $      ' numbers)' )
 9975 FORMAT( / ' Tests of the Generalized Nonsymmetric Eigenvalue ',
     $      'Problem routines' )
 9974 FORMAT( ' Tests of cdsbtrd', / ' (reduction of a symmetric band ',
     $      'matrix to tridiagonal form)' )
 9973 FORMAT( / 1X, 71( '-' ) )
 9972 FORMAT( / ' LAPACK VERSION 3.0, released June 30, 1999 ' )
 9971 FORMAT( / ' Tests of the Generalized Linear Regression Model ',
     $      'routines' )
 9970 FORMAT( / ' Tests of the Generalized QR and RQ routines' )
 9969 FORMAT( / ' Tests of the Generalized Singular Value',
     $      ' Decomposition routines' )
 9968 FORMAT( / ' Tests of the Linear Least Squares routines' )
 9967 FORMAT( ' Tests of cdgbbrd', / ' (reduction of a general band ',
     $      'matrix to real bidiagonal form)' )
 9966 FORMAT( / / 1X, A3, ':  NRHS =', I4 )
 9965 FORMAT( / ' Tests of the Generalized Nonsymmetric Eigenvalue ',
     $      'Problem Expert Driver cdggesX' )
 9964 FORMAT( / ' Tests of the Generalized Nonsymmetric Eigenvalue ',
     $      'Problem Driver cdgges' )
 9963 FORMAT( / ' Tests of the Generalized Nonsymmetric Eigenvalue ',
     $      'Problem Driver cdggev' )
 9962 FORMAT( / ' Tests of the Generalized Nonsymmetric Eigenvalue ',
     $      'Problem Expert Driver cdggevX' )
*
*     End of DCHKEE
*
      END
