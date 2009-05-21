      SUBROUTINE SERRHS( PATH, NUNIT )
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
*  SERRHS tests the error exits for csgebak, csgebal, csgehrd, csorghr,
*  csormhr, cshseqr, cshsein, and cstrevc.
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
      INTEGER            I, ILO, IHI, INFO, J, M, NT
*     ..
*     .. Local Arrays ..
      LOGICAL            SEL( NMAX )
      INTEGER            IFAILL( NMAX ), IFAILR( NMAX )
      REAL               A( NMAX, NMAX ), C( NMAX, NMAX ), TAU( NMAX ),
     $                   VL( NMAX, NMAX ), VR( NMAX, NMAX ), W( LW ),
     $                   WI( NMAX ), WR( NMAX ), S( NMAX )
*     ..
*     .. External Functions ..
      LOGICAL            LSAMEN
      EXTERNAL           LSAMEN
*     ..
*     .. External Subroutines ..
      EXTERNAL      CHKXER, csgebak, csgebal, csgehrd, cshsein, cshseqr,
     $                   csorghr, csormhr, cstrevc
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
         WI( J ) = REAL( J )
         SEL( J ) = .TRUE.
   20 CONTINUE
      OK = .TRUE.
      NT = 0
*
*     Test error exits of the nonsymmetric eigenvalue routines.
*
      IF( LSAMEN( 2, C2, 'HS' ) ) THEN
*
*        csgebal
*
         SRNAMT = 'csgebal'
         INFOT = 1
         CALL csgebal( '/', 0, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'csgebal', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgebal( 'N', -1, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'csgebal', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgebal( 'N', 2, A, 1, ILO, IHI, S, INFO )
         CALL CHKXER( 'csgebal', INFOT, NOUT, LERR, OK )
         NT = NT + 3
*
*        csgebak
*
         SRNAMT = 'csgebak'
         INFOT = 1
         CALL csgebak( '/', 'R', 0, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgebak( 'N', '/', 0, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgebak( 'N', 'R', -1, 1, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgebak( 'N', 'R', 0, 0, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csgebak( 'N', 'R', 0, 2, 0, S, 0, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgebak( 'N', 'R', 2, 2, 1, S, 0, A, 2, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgebak( 'N', 'R', 0, 1, 1, S, 0, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL csgebak( 'N', 'R', 0, 1, 0, S, -1, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         INFOT = 9
         CALL csgebak( 'N', 'R', 2, 1, 2, S, 0, A, 1, INFO )
         CALL CHKXER( 'csgebak', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        csgehrd
*
         SRNAMT = 'csgehrd'
         INFOT = 1
         CALL csgehrd( -1, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgehrd( 0, 0, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csgehrd( 0, 2, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgehrd( 1, 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csgehrd( 0, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csgehrd( 2, 1, 1, A, 1, TAU, W, 2, INFO )
         CALL CHKXER( 'csgehrd', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csgehrd( 2, 1, 2, A, 2, TAU, W, 1, INFO )
         CALL CHKXER( 'csgehrd', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        csorghr
*
         SRNAMT = 'csorghr'
         INFOT = 1
         CALL csorghr( -1, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorghr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csorghr( 0, 0, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorghr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csorghr( 0, 2, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorghr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csorghr( 1, 1, 0, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorghr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csorghr( 0, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorghr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csorghr( 2, 1, 1, A, 1, TAU, W, 1, INFO )
         CALL CHKXER( 'csorghr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csorghr( 3, 1, 3, A, 3, TAU, W, 1, INFO )
         CALL CHKXER( 'csorghr', INFOT, NOUT, LERR, OK )
         NT = NT + 7
*
*        csormhr
*
         SRNAMT = 'csormhr'
         INFOT = 1
         CALL csormhr( '/', 'N', 0, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL csormhr( 'L', '/', 0, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL csormhr( 'L', 'N', -1, 0, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL csormhr( 'L', 'N', 0, -1, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csormhr( 'L', 'N', 0, 0, 0, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csormhr( 'L', 'N', 0, 0, 2, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csormhr( 'L', 'N', 1, 2, 2, 1, A, 1, TAU, C, 1, W, 2,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL csormhr( 'R', 'N', 2, 1, 2, 1, A, 1, TAU, C, 2, W, 2,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csormhr( 'L', 'N', 1, 1, 1, 0, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csormhr( 'L', 'N', 0, 1, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL csormhr( 'R', 'N', 1, 0, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csormhr( 'L', 'N', 2, 1, 1, 1, A, 1, TAU, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL csormhr( 'R', 'N', 1, 2, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL csormhr( 'L', 'N', 2, 1, 1, 1, A, 2, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL csormhr( 'L', 'N', 1, 2, 1, 1, A, 1, TAU, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         INFOT = 13
         CALL csormhr( 'R', 'N', 2, 1, 1, 1, A, 1, TAU, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'csormhr', INFOT, NOUT, LERR, OK )
         NT = NT + 16
*
*        cshseqr
*
         SRNAMT = 'cshseqr'
         INFOT = 1
         CALL cshseqr( '/', 'N', 0, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cshseqr( 'E', '/', 0, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 3
         CALL cshseqr( 'E', 'N', -1, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cshseqr( 'E', 'N', 0, 0, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cshseqr( 'E', 'N', 0, 2, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cshseqr( 'E', 'N', 1, 1, 0, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cshseqr( 'E', 'N', 1, 1, 2, A, 1, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 7
         CALL cshseqr( 'E', 'N', 2, 1, 2, A, 1, WR, WI, C, 2, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cshseqr( 'E', 'V', 2, 1, 2, A, 2, WR, WI, C, 1, W, 1,
     $                INFO )
         CALL CHKXER( 'cshseqr', INFOT, NOUT, LERR, OK )
         NT = NT + 9
*
*        cshsein
*
         SRNAMT = 'cshsein'
         INFOT = 1
        CALL cshsein( '/', 'N', 'N', SEL, 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         INFOT = 2
        CALL cshsein( 'R', '/', 'N', SEL, 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         INFOT = 3
        CALL cshsein( 'R', 'N', '/', SEL, 0, A, 1, WR, WI, VL, 1, VR, 1,
     $                0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         INFOT = 5
         CALL cshsein( 'R', 'N', 'N', SEL, -1, A, 1, WR, WI, VL, 1, VR,
     $                1, 0, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         INFOT = 7
        CALL cshsein( 'R', 'N', 'N', SEL, 2, A, 1, WR, WI, VL, 1, VR, 2,
     $                4, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         INFOT = 11
        CALL cshsein( 'L', 'N', 'N', SEL, 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                4, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         INFOT = 13
        CALL cshsein( 'R', 'N', 'N', SEL, 2, A, 2, WR, WI, VL, 1, VR, 1,
     $                4, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         INFOT = 14
        CALL cshsein( 'R', 'N', 'N', SEL, 2, A, 2, WR, WI, VL, 1, VR, 2,
     $                1, M, W, IFAILL, IFAILR, INFO )
         CALL CHKXER( 'cshsein', INFOT, NOUT, LERR, OK )
         NT = NT + 8
*
*        cstrevc
*
         SRNAMT = 'cstrevc'
         INFOT = 1
         CALL cstrevc( '/', 'A', SEL, 0, A, 1, VL, 1, VR, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstrevc', INFOT, NOUT, LERR, OK )
         INFOT = 2
         CALL cstrevc( 'L', '/', SEL, 0, A, 1, VL, 1, VR, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstrevc', INFOT, NOUT, LERR, OK )
         INFOT = 4
         CALL cstrevc( 'L', 'A', SEL, -1, A, 1, VL, 1, VR, 1, 0, M, W,
     $                INFO )
         CALL CHKXER( 'cstrevc', INFOT, NOUT, LERR, OK )
         INFOT = 6
         CALL cstrevc( 'L', 'A', SEL, 2, A, 1, VL, 2, VR, 1, 4, M, W,
     $                INFO )
         CALL CHKXER( 'cstrevc', INFOT, NOUT, LERR, OK )
         INFOT = 8
         CALL cstrevc( 'L', 'A', SEL, 2, A, 2, VL, 1, VR, 1, 4, M, W,
     $                INFO )
         CALL CHKXER( 'cstrevc', INFOT, NOUT, LERR, OK )
         INFOT = 10
         CALL cstrevc( 'R', 'A', SEL, 2, A, 2, VL, 1, VR, 1, 4, M, W,
     $                INFO )
         CALL CHKXER( 'cstrevc', INFOT, NOUT, LERR, OK )
         INFOT = 11
         CALL cstrevc( 'L', 'A', SEL, 2, A, 2, VL, 2, VR, 1, 1, M, W,
     $                INFO )
         CALL CHKXER( 'cstrevc', INFOT, NOUT, LERR, OK )
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
     $        ' (', I3, ' tests done)' )
 9998 FORMAT( ' *** ', A3, ' routines failed the tests of the error ',
     $      'exits ***' )
*
      RETURN
*
*     End of SERRHS
*
      END
