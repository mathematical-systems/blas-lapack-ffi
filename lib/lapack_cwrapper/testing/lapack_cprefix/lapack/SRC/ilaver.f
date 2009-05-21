      SUBROUTINE ILAVER ( VERS_MAJOR, VERS_MINOR, VERS_PATCH )
*     
*  -- LAPACK routine (version 3) --
*     Univ. of Tennessee, Oak Ridge National Lab, Argonne National Lab,
*     Courant Institute, NAG Ltd., and Rice University
*     March 17, 2005
*     ..
*
*  Purpose
*  =======
*
*  This subroutine return the Lapack version
*
*  Arguments
*  =========
*  VERS_MAJOR   (output) INTEGER
*      return the lapack major version
*  VERS_MINOR   (output) INTEGER
*      return the lapack minor version from the major version
*  VERS_PATCH   (output) INTEGER
*      return the lapack patch version from the minor version
*  =====================================================================
*
      INTEGER VERS_MAJOR, VERS_MINOR, VERS_PATCH
*  =====================================================================
      VERS_MAJOR = 3
      VERS_MINOR = 0
      VERS_PATCH = 18
*  =====================================================================
*
      RETURN
      END
