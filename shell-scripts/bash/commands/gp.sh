gp() {
	if [ ! -z ${FORCE_COLOR+x} ]; then
		local fc="$FORCE_COLOR"
	fi
	export FORCE_COLOR=1

	local path=$(pdm get-path "$@")
	if [ $? -eq 0 ]; then
		cd "$path"
	fi

	if [ -z ${fc+x} ]; then
		unset FORCE_COLOR
	else
		export FORCE_COLOR="$fc"
	fi
}
