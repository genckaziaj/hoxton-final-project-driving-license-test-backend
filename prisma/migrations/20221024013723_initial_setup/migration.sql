-- CreateTable
CREATE TABLE "Test" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "Question" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "question" TEXT NOT NULL,
    "questionNumber" INTEGER NOT NULL,
    "imagePath" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    "testId" INTEGER NOT NULL,
    CONSTRAINT "Question_testId_fkey" FOREIGN KEY ("testId") REFERENCES "Test" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
