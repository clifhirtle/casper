#!/bin/sh

# Enable local domain password security settings
# Cliff Hirtle, 2/22/13, http://linkedin.com/in/clifhirtle
# See pwpolicy man page: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man8/pwpolicy.8.html

#### READ IN THE PARAMETERS
mountPoint=$1
computerName=$2
username=$3
useHistory=$4
useExpiration=$5
reqAlpha=$6
reqSymbol=$7
reqNumeric=$8
expirDate=$9
maxMinTillPassChange=$10
minChars=$11

#### SET VARIABLES
# useHistory=0 				# 0 = user can reuse the current password, 1 = user cannot reuse the current password, 2-15 = user cannot reuse the last n passwords.
# useExpiration=0				# If 1, user is required to change password on the date in expirDate
# useHardExpiration=0			# If 1, user's account is disabled on the date in hardExpirDate
# reqAlpha=0					# If 1, user's password is required to have a character in [A-Z][a-z]
# reqSymbol=0					# If 1, user's password is required to have a special character
# reqNumeric=1				# If 1, user's password is required to have a character in [0-9]
# expirDate=""				# Date for the password to expire, format must be: mm/dd/yy
# hardExpirDate=""			# Date for the user's account to be disabled, format must be: mm/dd/yy
# validAfter=""				# Date for the user's account to be enabled, format must be: mm/dd/yy
# maxMinTillPassChange=129600	# user is required to change the password at this interval, 129600=90days
# maxMinTilDisabled=""		# user's account is disabled after this interval
# maxMinNonUse=""				# user's account is disabled if it is not accessed by this interval
# maxFailedLogins=10			# user's account is disabled if the failed login count exceeds this number
# minChars=8					# passwords must contain at least minChars
# maxChars=100	 			# passwords are limited to maxChars

# Single line configure settings, disabling as changes appear to be inconsistent
# pwpolicy -nv /Local/Default -setglobalpolicy useHistory=$useHistory useExpiration=$useExpiration reqAlpha=$reqAlpha reqSymbol=$reqSymbol reqNumeric=$reqNumeric maxFailedLogins=$maxFailedLogins maxChars=$maxChars minChars=$minChars

# EXECUTE POLICIES
pwpolicy -nv /Local/Default -setglobalpolicy useHistory=$useHistory
pwpolicy -nv /Local/Default -setglobalpolicy useExpiration=$useExpiration
pwpolicy -nv /Local/Default -setglobalpolicy useHardExpiration=$useHardExpiration
pwpolicy -nv /Local/Default -setglobalpolicy reqAlpha=$reqAlpha
pwpolicy -nv /Local/Default -setglobalpolicy reqSymbol=$reqSymbol
pwpolicy -nv /Local/Default -setglobalpolicy reqNumeric=$reqNumeric
pwpolicy -nv /Local/Default -setglobalpolicy expirDate=$expirDate
# pwpolicy -nv /Local/Default -setglobalpolicy hardExpirDate=$hardExpirDate
# pwpolicy -nv /Local/Default -setglobalpolicy validAfter=$validAfter
pwpolicy -nv /Local/Default -setglobalpolicy maxMinTillPassChange=$maxMinTillPassChange
# pwpolicy -nv /Local/Default -setglobalpolicy maxMinTilDisabled=$maxMinTilDisabled
# pwpolicy -nv /Local/Default -setglobalpolicy maxMinNonUse=$maxMinNonUse
pwpolicy -nv /Local/Default -setglobalpolicy maxFailedLogins=$maxFailedLogins
pwpolicy -nv /Local/Default -setglobalpolicy minChars=$minChars
# pwpolicy -nv /Local/Default -setglobalpolicy maxChars=$maxChars

exit 1
