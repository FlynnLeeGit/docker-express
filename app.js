const express = require('express')
const logger = require('morgan')
const app = express()

const PORT = 8080

app.use(logger('dev'))

app.get('*',(req,res)=>{
  res.write('<h1>Hello World Second</h1>')
  res.end()
})

app.listen(PORT,()=>{
  console.log('server is runing on ',PORT)
})
