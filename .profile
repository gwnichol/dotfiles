# Only source the profile once
if [[ -z "$PROFILE_SOURCED" ]]; then
	export PROFILE_SOURCED=True
else
	return
fi

if [[ "$(hostname)" == "grants-ryzen" ]]; then
	export IS_DESKTOP=True
elif [[ "$(hostname)" == "grants-laptop" ]]; then
	export IS_LAPTOP=True
fi

if [[ -n "$IS_DESKTOP" ]]; then
	export LIBVIRT_DEFAULT_URI="qemu:///system"
elif [[ -n "$IS_LAPTOP" ]]; then
	export LIBVIRT_DEFAULT_URI="qemu+ssh://DESKTOP/system"
fi

export EDITOR=vim
export PATH="$HOME/.local/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.bin:/usr/local/sbin/:$PATH"
