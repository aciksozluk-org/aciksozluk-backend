const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send('Açıksözlük api çalışıyor')
})

app.listen(port, () => {
    console.log(`Açıksözlük app çalışıyor Port:${port}`)
})