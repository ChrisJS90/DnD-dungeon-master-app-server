-- CreateTable
CREATE TABLE "Character" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "player" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "background" TEXT NOT NULL,
    "race" TEXT NOT NULL,
    "alignment" TEXT NOT NULL,
    "profBonus" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stats" (
    "id" SERIAL NOT NULL,
    "characterId" INTEGER NOT NULL,
    "str" INTEGER NOT NULL,
    "dex" INTEGER NOT NULL,
    "con" INTEGER NOT NULL,
    "int" INTEGER NOT NULL,
    "wis" INTEGER NOT NULL,
    "cha" INTEGER NOT NULL,

    CONSTRAINT "Stats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SavingThrows" (
    "id" SERIAL NOT NULL,
    "characterId" INTEGER NOT NULL,
    "str" INTEGER NOT NULL,
    "dex" INTEGER NOT NULL,
    "con" INTEGER NOT NULL,
    "int" INTEGER NOT NULL,
    "wis" INTEGER NOT NULL,
    "cha" INTEGER NOT NULL,

    CONSTRAINT "SavingThrows_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skills" (
    "id" SERIAL NOT NULL,
    "characterId" INTEGER NOT NULL,
    "acrobatics" INTEGER NOT NULL,
    "animHand" INTEGER NOT NULL,
    "arcane" INTEGER NOT NULL,
    "athl" INTEGER NOT NULL,
    "decep" INTEGER NOT NULL,
    "hist" INTEGER NOT NULL,
    "insight" INTEGER NOT NULL,
    "intimid" INTEGER NOT NULL,
    "invest" INTEGER NOT NULL,
    "med" INTEGER NOT NULL,
    "nature" INTEGER NOT NULL,
    "percep" INTEGER NOT NULL,
    "perf" INTEGER NOT NULL,
    "pers" INTEGER NOT NULL,
    "religion" INTEGER NOT NULL,
    "sOfH" INTEGER NOT NULL,
    "stealth" INTEGER NOT NULL,
    "surv" INTEGER NOT NULL,

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Combat" (
    "id" SERIAL NOT NULL,
    "characterId" INTEGER NOT NULL,
    "hpMax" INTEGER NOT NULL,
    "ac" INTEGER NOT NULL,
    "speed" INTEGER NOT NULL,
    "hitDice" TEXT NOT NULL,

    CONSTRAINT "Combat_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Stats_characterId_key" ON "Stats"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "SavingThrows_characterId_key" ON "SavingThrows"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Skills_characterId_key" ON "Skills"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Combat_characterId_key" ON "Combat"("characterId");

-- AddForeignKey
ALTER TABLE "Stats" ADD CONSTRAINT "Stats_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavingThrows" ADD CONSTRAINT "SavingThrows_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Skills" ADD CONSTRAINT "Skills_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Combat" ADD CONSTRAINT "Combat_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
