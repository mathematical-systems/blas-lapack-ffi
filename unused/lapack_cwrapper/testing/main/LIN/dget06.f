      DOUBLE PRECISION FUNCTION DGET06(RCOND,RCONDC)
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      DOUBLE PRECISION RCOND,RCONDC
*     ..
*
*  Purpose
*  =======
*
*  DGET06 computes a test ratio to compare two values for RCOND.
*
*  Arguments
*  ==========
*
*  RCOND   (input) DOUBLE PRECISION
*          The estimate of the reciprocal of the condition number of A,
*          as computed by cdgecon.
*
*  RCONDC  (input) DOUBLE PRECISION
*          The reciprocal of the condition number of A, computed as
*          ( 1/norm(A) ) / norm(inv(A)).
*
*  =====================================================================
*
*     .. Parameters ..
      DOUBLE PRECISION ZERO,ONE
      PARAMETER (ZERO=0.0D+0,ONE=1.0D+0)
*     ..
*     .. Local Scalars ..
      DOUBLE PRECISION EPS,RAT
*     ..
*     .. External Functions ..
      DOUBLE PRECISION DLAMCH
      EXTERNAL DLAMCH
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC MAX,MIN
*     ..
*     .. Executable Statements ..
*
      EPS = DLAMCH('Epsilon')
      IF (RCOND.GT.ZERO) THEN
          IF (RCONDC.GT.ZERO) THEN
              RAT = MAX(RCOND,RCONDC)/MIN(RCOND,RCONDC) - (ONE-EPS)
          ELSE
              RAT = RCOND/EPS
          END IF
      ELSE
          IF (RCONDC.GT.ZERO) THEN
              RAT = RCONDC/EPS
          ELSE
              RAT = ZERO
          END IF
      END IF
      DGET06 = RAT
      RETURN
*
*     End of DGET06
*
      END
