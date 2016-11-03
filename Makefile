USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=allow_diagnostic_sudo
REVERSE_DOMAIN=edu.sju
PACKAGE_VERSION=1.0
PAYLOAD=\
	pack-diag_sudo

l_private_etc_sudoersd: l_private_etc
	@sudo mkdir -p ${WORK_D}/private/etc/sudoers.d
	@sudo chmod 755 ${WORK_D}/private/etc/sudoers.d
	@sudo chown root:admin ${WORK_D}/private/etc/sudoers.d

pack-diag_sudo: l_private_etc_sudoersd
	@sudo ${CP} ./diagnostic ${WORK_D}/private/etc/sudoers.d/diagnostic
	@sudo chmod 400 ${WORK_D}/private/etc/sudoers.d/diagnostic
	@sudo chown root:admin ${WORK_D}/private/etc/sudoers.d/diagnostic

munkiimport: dmg
		munkiimport \
--nointeractive \
--subdirectory scripts \
--name "${TITLE}" \
--displayname "Allow diagnostic sudo" \
--description "Allows the diagnostic user sudo access, as it does not have a password set." \
--category "Scripts" \
--developer "Saint Joseph's University" \
--minimum_os_version "10.12.0" \
--installcheck_script ./munki_installcheck_script.sh \
--unattended_install \
"${DMG_NAME}"