function debounce(func, wait) {
    let timeout;
    return function() {
        let newSearchTerm = this.value.trim();
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            if (newSearchTerm !== "") {
                func.apply(this, arguments);
            }
        }, wait);
    };
}

document.querySelector('#search-input').addEventListener('input', debounce(function() {
    fetch('/searches', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ search: { term: this.value.trim() } }) // Send the trimmed search term
    });
}, 500));

document.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault();
});
