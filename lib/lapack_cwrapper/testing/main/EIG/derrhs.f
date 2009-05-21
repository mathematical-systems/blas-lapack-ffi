      SUBROUTINE DERRHS( PATH, NUNIT )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     October 31, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*3        PATH
      INTEGER            NUNIT
*     ..
*
*  Purpose
*  =======
*
*  DERRHS tests the error exits for cdgebak, csgebal, csgehrd, cdorghr,
*  cdormhr, cdhseqr, cshsein, and cdtrevc.
*
*  Arguments
*  =========
*
*  PATH    (input) CHARACTER*3
*          The LAPACK path name for the routines to be tested.
*
*  NUNIT   (input) INTEGER
*          The unit number for output.
*
*  =====================================================================
*
*     .. Parameters ..
      INTEGER            NMAX, LW
      PARAMETER          ( NMAX = 3, LW = ( NMAX+2 )*( NMAX+2 )+NMAX )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, IHI, ILO, INFO, J, M, NT
*     ..
*     .. Local Arrays ..
      LOGICAL            SEL( NMAX )
      INTEGER            IFAILL( NMAX ), IFAILR( NMAX )
      DOUBLE PRECISION   A( NMAX, NMAX ), C( NMAX, NMAX ), S( NMAX ),
     $                   TAU( NMAX ), VL( NMAX, NMAX ),
     $                   VR( NMAX, NMAX ), W( LW ), WI( NMAX ),
     $                   WR( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL      CHKXER, cdgebak, cdgebal, cdgehrd, cdhsein, cdhseqr,
     $                   cdorghr, cdormhr, cdtrevc
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          DBLE
*     ..
*     .. Scalars in Common ..
      LOGICAL            LERR, OK
      CHARACTER*7        SRNAMT
      INTEGER            INFOT, NOUT
*     ..
*     .. Common blocks ..
      COMMON             / INFOC / INFOT, NOUT, OK, LERR
      COMMON             / SRNAMC / SRNAMT
*     ..
*     .. Executable Statements ..
*
      NOUT = NUNIT
      WRITE( NOUT, FMT = * )
      C2 = PATH( 2: 3 )
*
*     Set the variables to innocuous values.
*
      DO 20 J = 1, NMAX
         DO 10 I = 1, NMAX
            A( I, J ) = 1.D0 / DBLE( I+J )
   10    CONTINUE
         WI( J ) = DBLE( J )
         SEL( J ) = .TRUE.
   20 CONTINUE
      OK = .TRUE.
      NT = 0
*
*     Test error exits of the nonsymmetric eigenvalue routines.
*
      IF( LSAMEN( 2, C2, 'HS' ) ) THEN
*
*        cdgebal
*
         SRNAMT = 'cdgebal'
         INFOT = 1
         CALL cdgebal( '/', 0, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'cdgebal', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgebal( 'N', -1, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'cdgebal', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgebal( 'N', 2, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'cdgebal', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        cdgebak
*
         SRNAMT = 'cdgebak'
         INFOT = 1
         CALL cdgebak( '/', 'R', 0, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgebak( 'N', '/', 0, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgebak( 'N', 'R', -1, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgebak( 'N', 'R', 0, 0, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdgebak( 'N', 'R', 0, 2, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgebak( 'N', 'R', 2, 2, 1, S, 0, A, 2, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgebak( 'N', 'R', 0, 1, 1, S, 0, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdgebak( 'N', 'R', 0, 1, 0, S, -1, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL cdgebak( 'N', 'R', 2, 1, 2, S, 0, A, 1, INFO )
         CALL CHKXER( 'cdgebak', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cdgehrd
*
         SRNAMT = 'cdgehrd'
         INFOT = 1
         CALL cdgehrd( -1, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgehrd( 0, 0, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdgehrd( 0, 2, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgehrd( 1, 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdgehrd( 0, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdgehrd( 2, 1, 1, A, 1, TAU, W, 2, INFO )
         CALL CHKXER( 'cdgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdgehrd( 2, 1, 2, A, 2, TAU, W, 1, INFO )
         CALL CHKXER( 'cdgehrd', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        cdorghr
*
         SRNAMT = 'cdorghr'
         INFOT = 1
         CALL cdorghr( -1, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorghr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdorghr( 0, 0, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorghr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdorghr( 0, 2, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorghr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdorghr( 1, 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorghr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdorghr( 0, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorghr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdorghr( 2, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorghr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdorghr( 3, 1, 3, A, 3, TAU, W, 1, INFO )
         CALL CHKXER( 'cdorghr', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        cdormhr
*
         SRNAMT = 'cdormhr'
         INFOT = 1
         CALL cdormhr( '/', 'N', 0, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdormhr( 'L', '/', 0, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdormhr( 'L', 'N', -1, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdormhr( 'L', 'N', 0, -1, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdormhr( 'L', 'N', 0, 0, 0, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdormhr( 'L', 'N', 0, 0, 2, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdormhr( 'L', 'N', 1, 2, 2, 1, A, 1, TAU, C, 1, W, 2,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdormhr( 'R', 'N', 2, 1, 2, 1, A, 1, TAU, C, 2, W, 2,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdormhr( 'L', 'N', 1, 1, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdormhr( 'L', 'N', 0, 1, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdormhr( 'R', 'N', 1, 0, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdormhr( 'L', 'N', 2, 1, 1, 1, A, 1, TAU, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdormhr( 'R', 'N', 1, 2, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdormhr( 'L', 'N', 2, 1, 1, 1, A, 2, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdormhr( 'L', 'N', 1, 2, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cdormhr( 'R', 'N', 2, 1, 1, 1, A, 1, TAU, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cdormhr', INFOT, NOUT, LERR, OK )
         NT = NT + 16
*
*        cdhseqr
*
         SRNAMT = 'cdhseqr'
         INFOT = 1
         CALL cdhseqr( '/', 'N', 0, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdhseqr( 'E', '/', 0, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cdhseqr( 'E', 'N', -1, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdhseqr( 'E', 'N', 0, 0, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdhseqr( 'E', 'N', 0, 2, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdhseqr( 'E', 'N', 1, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdhseqr( 'E', 'N', 1, 1, 2, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cdhseqr( 'E', 'N', 2, 1, 2, A, 1, WR, WI, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdhseqr( 'E', 'V', 2, 1, 2, A, 2, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cdhseqr', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cdhsein
*
         SRNAMT = 'cdhsein'
         INFOT = 1
        CALL cdhsein( '/', 'N', 'N', SEL, 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cdhsein( 'R', '/', 'N', SEL, 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cdhsein( 'R', 'N', '/', SEL, 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cdhsein( 'R', 'N', 'N', SEL, -1, A, 1, WR, WI, VL, 1, VR,
     $                1, 0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cdhsein( 'R', 'N', 'N', SEL, 2, A, 1, WR, WI, VL, 1, VR, 2,
     $                4, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cdhsein( 'L', 'N', 'N', SEL, 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                4, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cdhsein( 'R', 'N', 'N', SEL, 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                4, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL cdhsein( 'R', 'N', 'N', SEL, 2, A, 2, WR, WI, VL, 1, VR, 2,
     $                1, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cdhsein', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        cdtrevc
*
         SRNAMT = 'cdtrevc'
         INFOT = 1
         CALL cdtrevc( '/', 'A', SEL, 0, A, 1, VL, 1, VR, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtrevc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cdtrevc( 'L', '/', SEL, 0, A, 1, VL, 1, VR, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtrevc', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cdtrevc( 'L', 'A', SEL, -1, A, 1, VL, 1, VR, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cdtrevc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cdtrevc( 'L', 'A', SEL, 2, A, 1, VL, 2, VR, 1, 4, M, W,
     $                INFO )
         CALL CHKXER( 'cdtrevc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cdtrevc( 'L', 'A', SEL, 2, A, 2, VL, 1, VR, 1, 4, M, W,
     $                INFO )
         CALL CHKXER( 'cdtrevc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cdtrevc( 'R', 'A', SEL, 2, A, 2, VL, 1, VR, 1, 4, M, W,
     $                INFO )
         CALL CHKXER( 'cdtrevc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cdtrevc( 'L', 'A', SEL, 2, A, 2, VL, 2, VR, 1, 1, M, W,
     $                INFO )
         CALL CHKXER( 'cdtrevc', INFOT, NOUT, LERR, OK )
         NT = NT + 7
      END IF
*
*     Print a summary line.
*
      IF( OK ) THEN
         WRITE( NOUT, FMT = 9999 )PATH, NT
      ELSE
         WRITE( NOUT, FMT = 9998 )PATH
      END IF
*
 9999 FORMAT( 1X, A3, ' routines passed the tests of the error exits',
     $      ' (', I3, ' tests done)' )
 9998 FORMAT( ' *** ', A3, ' routines failed the tests of the error ',
     $      'exits ***' )
*
      RETURN
*
*     End of DERRHS
*
      END
