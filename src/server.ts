import express from "express";
import cors from "cors";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const app = express();
app.use(cors());
app.use(express.json());

const port = 2222;

app.get("/tests", async (req, res) => {
  const tests = await prisma.test.findMany({
    include: { questions: true },
  });
  res.send(tests);
});

app.get("/tests/:id", async (req, res) => {
  const test = await prisma.test.findUnique({
    where: { id: Number(req.params.id) },
    include: { questions: true },
  });

  if (test) {
    res.send(test);
  } else {
    res.status(404).send({ error: "Person not found." });
  }
});

app.listen(port, () => {
  console.log(`Listening: http://localhost:${port}`);
});
