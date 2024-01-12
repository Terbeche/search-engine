let lastSearchTerm = "";

function debounce(func, wait) {
    let timeout;
    return function() {
        let newSearchTerm = this.value.trim(); // Trim the search term
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            if (newSearchTerm !== "" && newSearchTerm !== lastSearchTerm) { // Check if the search term is not empty
                func.apply(this, arguments);
                lastSearchTerm = newSearchTerm;
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
