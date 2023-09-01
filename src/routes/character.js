import { Router } from 'express'
import { getAll } from '../controllers/character.js'

const router = Router()

router.get('/', getAll)

export default router