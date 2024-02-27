#! /bin/bash
# Script for installing my shell preferences

DEST_DIR=~
SCRIPT_DIR=$(dirname "$0")
INSTALL_DIR=${SCRIPT_DIR}/install
APPEND_DIR=${SCRIPT_DIR}/append
RUN_DIR=${SCRIPT_DIR}/run

printf "\n### Installing files to ${DEST_DIR}\n"
if hash rsync 2>/dev/null; then
	rsync -av --backup "${INSTALL_DIR}/" "${DEST_DIR}/"
else
	# In case rsync is not available (e.g. on Docker)
	cp -rTvp "${INSTALL_DIR}" "${DEST_DIR}"
fi

ml_string_in_file() {
	source_file=$1
	dest_file=$2
	lines=$(awk 'FNR==NR {a[$0]++; next} !($0 in a)' $dest_file $source_file)

	if [ -z "${lines}" ]; then
		return 0
	fi

	return 1

}

backup_append_to_file() {
	source_file=$1
	dest_file=$2

	cp "${dest_file}" "${dest_file}.bak"
}

append_to_file() {
	source_file=$1
	dest_file=$2
	dest_dir=$(dirname "${dest_file}")

	if [ ! -d "${dest_dir}" ]; then
		printf "\n\tCreating directory ${dest_dir}\n"
		mkdir -p "${dest_dir}"
	fi

	printf "\n\tAppending ${source_file} to ${dest_file}\n"
	if [ -f "$dest_file" ]; then
		if ml_string_in_file $source_file $dest_file ; then
			printf "\t${source_file} already in ${dest_file}. Skipping.\n"
		else
			printf "\tBacking up ${dest_file} to ${dest_file}.bak\n"
			cp "${dest_file}" "${dest_file}.bak"
			cat "${source_file}" >> "${dest_file}"
		fi
	else
		printf "\t${dest_file} not found. Creating.\n"
		cat "${source_file}" >> "${dest_file}"
	fi
}

printf "\n### Appending to files\n"
cd "${APPEND_DIR}"
APPEND_FILES=$(find . -type f | cut -c 3- )
for file in ${APPEND_FILES}; do
	append_to_file "${file}" "${DEST_DIR}/${file}"
done
cd ..


printf "\n### Running installation scripts\n"
cd "${RUN_DIR}"
RUN_FILES=$(find . -type f | cut -c 3- )
for file in $RUN_FILES; do
	printf "\n\tRunning $file\n"
	bash $file
done
cd ..

printf "\nSourcing .bashrc profile to make sure there are no errors.\n"
source ~/.bashrc

printf "\nRun source ~/.bashrc or start a new session for the changes to take effect."
printf "\nDone.\n"
