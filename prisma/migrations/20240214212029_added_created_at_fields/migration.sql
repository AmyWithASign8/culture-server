-- CreateTable
CREATE TABLE "User" (
    "uid" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "avatar" BYTEA,
    "created_at" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("uid")
);

-- CreateTable
CREATE TABLE "Category" (
    "uid" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "icon" VARCHAR(255),
    "user_uid" UUID NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("uid")
);

-- CreateTable
CREATE TABLE "CategoryItem" (
    "uid" UUID NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255),
    "image" BYTEA,
    "created_at" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "category_uid" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_uid_key" ON "User"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "User_name_key" ON "User"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Category_uid_key" ON "Category"("uid");

-- CreateIndex
CREATE UNIQUE INDEX "CategoryItem_uid_key" ON "CategoryItem"("uid");

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_user_uid_fkey" FOREIGN KEY ("user_uid") REFERENCES "User"("uid") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CategoryItem" ADD CONSTRAINT "CategoryItem_category_uid_fkey" FOREIGN KEY ("category_uid") REFERENCES "Category"("uid") ON DELETE CASCADE ON UPDATE CASCADE;
