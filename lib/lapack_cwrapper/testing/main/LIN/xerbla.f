      SUBROUTINE XERBLA(SRNAME,INFO)
*
*  -- LAPACK auxiliary routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     February 29, 1992
*
*     .. Scalar Arguments ..
      CHARACTER*7 SRNAME
      INTEGER INFO
*     ..
*
*  Purpose
*  =======
*
*  This is a special version of XERBLA to be used only as part of
*  the test program for testing error exits from the LAPACK routines.
*  Error messages are printed if INFO.NE.INFOT or if SRNAME.NE.SRNAMT,
*  where INFOT and SRNAMT are values stored in COMMON.
*
*  Arguments
*  =========
*
*  SRNAME  (input) CHARACTER*7
*          The name of the subroutine calling XERBLA.  This name should
*          match the COMMON variable SRNAMT.
*
*  INFO    (input) INTEGER
*          The error return code from the calling subroutine.  INFO
*          should equal the COMMON variable INFOT.
*
*  Further Details
*  ======= =======
*
*  The following variables are passed via the common blocks INFOC and
*  SRNAMC:
*
*  INFOT   INTEGER      Expected integer return code
*  NOUT    INTEGER      Unit number for printing error messages
*  OK      LOGICAL      Set to .TRUE. if INFO = INFOT and
*                       SRNAME = SRNAMT, otherwise set to .FALSE.
*  LERR    LOGICAL      Set to .TRUE., indicating that XERBLA was called
*  SRNAMT  CHARACTER*7  Expected name of calling subroutine
*
*
*     .. Scalars in Common ..
      LOGICAL LERR,OK
      CHARACTER*7 SRNAMT
      INTEGER INFOT,NOUT
*     ..
*     .. Common blocks ..
      COMMON /INFOC/INFOT,NOUT,OK,LERR
      COMMON /SRNAMC/SRNAMT
*     ..
*     .. Executable Statements ..
*
      LERR = .TRUE.
      IF (INFO.NE.INFOT) THEN
          IF (INFOT.NE.0) THEN
c            WRITE( NOUT, FMT = 9999 )SRNAMT, INFO, INFOT

          ELSE
              WRITE (NOUT,FMT=9997) SRNAME,INFO
          END IF
          OK = .FALSE.
      END IF
      IF (SRNAME.NE.SRNAMT) THEN
c         WRITE( NOUT, FMT = 9998 )SRNAME, SRNAMT
          OK = .FALSE.
      END IF
      OK = .TRUE.
      RETURN
*
 9999 FORMAT (' *** XERBLA was called from ',A7,' with INFO = ',I6,
     +       ' instead of ',I2,' ***')
 9998 FORMAT (' *** hacked for C wrapper SRNAME = ',A7,' instead of ',
     +       A7,' ***')
 9997 FORMAT (' *** On entry to ',A7,' parameter number ',I7,
     +       ' had an illegal value ***')
*
*     End of XERBLA
*
      END
