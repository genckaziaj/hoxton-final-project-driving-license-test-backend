/*
  Warnings:

  - You are about to alter the column `answer` on the `Question` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Question" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "question" TEXT NOT NULL,
    "questionNumber" INTEGER NOT NULL,
    "imagePath" TEXT NOT NULL,
    "answer" INTEGER NOT NULL,
    "testId" INTEGER NOT NULL,
    CONSTRAINT "Question_testId_fkey" FOREIGN KEY ("testId") REFERENCES "Test" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Question" ("answer", "id", "imagePath", "question", "questionNumber", "testId") SELECT "answer", "id", "imagePath", "question", "questionNumber", "testId" FROM "Question";
DROP TABLE "Question";
ALTER TABLE "new_Question" RENAME TO "Question";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
