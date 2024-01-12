function debounce(func, wait) {
    let timeout;
    return function() {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, arguments), wait);
    };
}

document.querySelector('#search-input').addEventListener('input', debounce(function() {
    console.log("Sending search term to server...");
    fetch('/searches', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ search: { term: this.value, ip: '127.0.0.1' } })
    });
}, 500));

document.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault();
});
