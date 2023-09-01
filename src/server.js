import cors from 'cors'
import express from 'express'
import characterRouter from './routes/character.js'


const app = express()
app.disable('x-powered-by')
app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use('/character', characterRouter)

export default app