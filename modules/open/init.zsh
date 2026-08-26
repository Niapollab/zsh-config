if ! command -v open >/dev/null 2>&1 && command -v xdg-open >/dev/null 2>&1; then
    open() {
        (xdg-open "$@" >/dev/null 2>&1 &)
    }
fi
