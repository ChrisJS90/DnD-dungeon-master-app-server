const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function seed() {
  const createdCharacter = await prisma.character.create({
    data: {
      name: "Nyx",
      player: "Chris",
      class: "Paladin",
      level: 2,
      background: "Folk Hero",
      race: "Rock Gnome",
      alignment: "Neutral Good",
      profBonus: 2,
      stats: {
        create: {
          str: 16,
          dex: 8,
          con: 13,
          int: 9,
          wis: 11,
          cha: 14,
        },
      },
      savingThrows: {
        create: {
          str: 3,
          dex: -1,
          con: 1,
          int: -1,
          wis: 2,
          cha: 4,
        },
      },
      skills: {
        create: {
          acrobatics: 0,
          animHand: -1,
          arcane: 2,
          athl: -1,
          decep: 3,
          hist: -1,
          insight: 0,
          intimid: 2,
          invest: 1,
          med: 0,
          nature: -1,
          percep: 0,
          perf: 2,
          pers: 4,
          religion: 1,
          sOfH: -1,
          stealth: -1,
          surv: 2,
        },
      },
      combat: {
        create: {
            hpMax: 20,
            ac: 18,
            speed: 25,
            hitDice: "2d10"
        }
      }
    },
  });

  console.log("Character created", createdCharacter);

  // Add your code here

  // Don't edit any of the code below this line
  process.exit(0);
}

seed().catch(async (error) => {
  console.error(error);
  await prisma.$disconnect();
  process.exit(1);
});
