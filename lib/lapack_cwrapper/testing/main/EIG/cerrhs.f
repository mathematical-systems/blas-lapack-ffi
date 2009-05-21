      SUBROUTINE CERRHS( PATH, NUNIT )
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
*  CERRHS tests the error exits for ccgebak, ccgebal, ccgehrd, ccunghr,
*  ccunmhr, cchseqr, cchsein, and cctrevc.
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
      PARAMETER          ( NMAX = 3, LW = NMAX*NMAX )
*     ..
*     .. Local Scalars ..
      CHARACTER*2        C2
      INTEGER            I, IHI, ILO, INFO, J, M, NT
*     ..
*     .. Local Arrays ..
      LOGICAL            SEL( NMAX )
      INTEGER            IFAILL( NMAX ), IFAILR( NMAX )
      REAL               RW( NMAX ), S( NMAX )
      COMPLEX            A( NMAX, NMAX ), C( NMAX, NMAX ), TAU( NMAX ),
     $                   VL( NMAX, NMAX ), VR( NMAX, NMAX ), W( LW ),
     $                   X( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL      CHKXER, ccgebak, ccgebal, ccgehrd, cchsein, cchseqr,
     $                   ccunghr, ccunmhr, cctrevc
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          REAL
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
            A( I, J ) = 1. / REAL( I+J )
   10    CONTINUE
         SEL( J ) = .TRUE.
   20 CONTINUE
      OK = .TRUE.
      NT = 0
*
*     Test error exits of the nonsymmetric eigenvalue routines.
*
      IF( LSAMEN( 2, C2, 'HS' ) ) THEN
*
*        ccgebal
*
         SRNAMT = 'ccgebal'
         INFOT = 1
         CALL ccgebal( '/', 0, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'ccgebal', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgebal( 'N', -1, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'ccgebal', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgebal( 'N', 2, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'ccgebal', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        ccgebak
*
         SRNAMT = 'ccgebak'
         INFOT = 1
         CALL ccgebak( '/', 'R', 0, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgebak( 'N', '/', 0, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgebak( 'N', 'R', -1, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgebak( 'N', 'R', 0, 0, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccgebak( 'N', 'R', 0, 2, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgebak( 'N', 'R', 2, 2, 1, S, 0, A, 2, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgebak( 'N', 'R', 0, 1, 1, S, 0, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL ccgebak( 'N', 'R', 0, 1, 0, S, -1, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL ccgebak( 'N', 'R', 2, 1, 2, S, 0, A, 1, INFO )
         CALL CHKXER( 'ccgebak', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        ccgehrd
*
         SRNAMT = 'ccgehrd'
         INFOT = 1
         CALL ccgehrd( -1, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgehrd( 0, 0, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccgehrd( 0, 2, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgehrd( 1, 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccgehrd( 0, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccgehrd( 2, 1, 1, A, 1, TAU, W, 2, INFO )
         CALL CHKXER( 'ccgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccgehrd( 2, 1, 2, A, 2, TAU, W, 1, INFO )
         CALL CHKXER( 'ccgehrd', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        ccunghr
*
         SRNAMT = 'ccunghr'
         INFOT = 1
         CALL ccunghr( -1, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccunghr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccunghr( 0, 0, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccunghr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccunghr( 0, 2, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccunghr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccunghr( 1, 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccunghr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccunghr( 0, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccunghr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccunghr( 2, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'ccunghr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccunghr( 3, 1, 3, A, 3, TAU, W, 1, INFO )
         CALL CHKXER( 'ccunghr', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        ccunmhr
*
         SRNAMT = 'ccunmhr'
         INFOT = 1
         CALL ccunmhr( '/', 'N', 0, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL ccunmhr( 'L', '/', 0, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL ccunmhr( 'L', 'N', -1, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL ccunmhr( 'L', 'N', 0, -1, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccunmhr( 'L', 'N', 0, 0, 0, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccunmhr( 'L', 'N', 0, 0, 2, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccunmhr( 'L', 'N', 1, 2, 2, 1, A, 1, TAU, C, 1, W, 2,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL ccunmhr( 'R', 'N', 2, 1, 2, 1, A, 1, TAU, C, 2, W, 2,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccunmhr( 'L', 'N', 1, 1, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccunmhr( 'L', 'N', 0, 1, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL ccunmhr( 'R', 'N', 1, 0, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccunmhr( 'L', 'N', 2, 1, 1, 1, A, 1, TAU, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL ccunmhr( 'R', 'N', 1, 2, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL ccunmhr( 'L', 'N', 2, 1, 1, 1, A, 2, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL ccunmhr( 'L', 'N', 1, 2, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL ccunmhr( 'R', 'N', 2, 1, 1, 1, A, 1, TAU, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'ccunmhr', INFOT, NOUT, LERR, OK )
         NT = NT + 16
*
*        cchseqr
*
         SRNAMT = 'cchseqr'
         INFOT = 1
         CALL cchseqr( '/', 'N', 0, 1, 0, A, 1, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchseqr( 'E', '/', 0, 1, 0, A, 1, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchseqr( 'E', 'N', -1, 1, 0, A, 1, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchseqr( 'E', 'N', 0, 0, 0, A, 1, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cchseqr( 'E', 'N', 0, 2, 0, A, 1, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cchseqr( 'E', 'N', 1, 1, 0, A, 1, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cchseqr( 'E', 'N', 1, 1, 2, A, 1, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchseqr( 'E', 'N', 2, 1, 2, A, 1, X, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cchseqr( 'E', 'V', 2, 1, 2, A, 2, X, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cchseqr', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cchsein
*
         SRNAMT = 'cchsein'
         INFOT = 1
         CALL cchsein( '/', 'N', 'N', SEL, 0, A, 1, X, VL, 1, VR, 1,
     $                0, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cchsein( 'R', '/', 'N', SEL, 0, A, 1, X, VL, 1, VR, 1,
     $                0, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cchsein( 'R', 'N', '/', SEL, 0, A, 1, X, VL, 1, VR, 1,
     $                0, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cchsein( 'R', 'N', 'N', SEL, -1, A, 1, X, VL, 1, VR,
     $                1, 0, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cchsein( 'R', 'N', 'N', SEL, 2, A, 1, X, VL, 1, VR, 2,
     $                4, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cchsein( 'L', 'N', 'N', SEL, 2, A, 2, X, VL, 1, VR, 1,
     $                4, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         INFOT = 12
         CALL cchsein( 'R', 'N', 'N', SEL, 2, A, 2, X, VL, 1, VR, 1,
     $                4, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL cchsein( 'R', 'N', 'N', SEL, 2, A, 2, X, VL, 1, VR, 2,
     $                1, M, W, RW, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cchsein', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        cctrevc
*
         SRNAMT = 'cctrevc'
         INFOT = 1
         CALL cctrevc( '/', 'A', SEL, 0, A, 1, VL, 1, VR, 1, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrevc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cctrevc( 'L', '/', SEL, 0, A, 1, VL, 1, VR, 1, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrevc', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cctrevc( 'L', 'A', SEL, -1, A, 1, VL, 1, VR, 1, 0, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrevc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cctrevc( 'L', 'A', SEL, 2, A, 1, VL, 2, VR, 1, 4, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrevc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cctrevc( 'L', 'A', SEL, 2, A, 2, VL, 1, VR, 1, 4, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrevc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cctrevc( 'R', 'A', SEL, 2, A, 2, VL, 1, VR, 1, 4, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrevc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cctrevc( 'L', 'A', SEL, 2, A, 2, VL, 2, VR, 1, 1, M, W,
     $                RW, INFO )
         CALL CHKXER( 'cctrevc', INFOT, NOUT, LERR, OK )
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
*     End of CERRHS
*
      END
