-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "full_name" VARCHAR(45) NOT NULL,
    "email" VARCHAR(45) NOT NULL,
    "address" VARCHAR(65) NOT NULL,
    "gender" VARCHAR(4) NOT NULL,
    "telephone" VARCHAR(16) NOT NULL,
    "password" VARCHAR(45) NOT NULL,
    "privileges_id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "privileges" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "privileges_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "honors" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "level" INTEGER NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "honors_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "nationalities" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "nationalities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customers" (
    "id" TEXT NOT NULL,
    "full_name" VARCHAR(45) NOT NULL,
    "cpf" VARCHAR(15) NOT NULL,
    "email" VARCHAR(45) NOT NULL,
    "gender" VARCHAR(4) NOT NULL,
    "password" VARCHAR(45) NOT NULL,
    "points" INTEGER NOT NULL,
    "address" VARCHAR(65) NOT NULL,
    "telephone" VARCHAR(16) NOT NULL,
    "cnh_code" VARCHAR(25) NOT NULL,
    "cnh_category" VARCHAR(6) NOT NULL,
    "honors_id" TEXT NOT NULL,
    "nationalities_id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reserves" (
    "id" TEXT NOT NULL,
    "daily_amount" INTEGER NOT NULL,
    "withdrawn" DATE NOT NULL,
    "return" DATE NOT NULL,
    "value" DECIMAL(10,2) NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "customers_id" TEXT NOT NULL,
    "vehicles_id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "reserves_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vehicles" (
    "id" TEXT NOT NULL,
    "chassi" VARCHAR(45) NOT NULL,
    "plate" VARCHAR(45) NOT NULL,
    "mark" VARCHAR(30) NOT NULL,
    "model" VARCHAR(20) NOT NULL,
    "year" DATE NOT NULL,
    "color" VARCHAR(20) NOT NULL,
    "crlv_document" VARCHAR(45) NOT NULL,
    "cylinder_capacity" INTEGER NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "units_id" TEXT NOT NULL,
    "categories_id" TEXT NOT NULL,
    "groups_id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "vehicles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "prices" (
    "id" TEXT NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "prices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "prices_id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "groups" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "units" (
    "id" TEXT NOT NULL,
    "unit" VARCHAR(45) NOT NULL,
    "cities_id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "units_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cities" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "states_id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "states" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_date" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "states_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "privileges_name_key" ON "privileges"("name");

-- CreateIndex
CREATE UNIQUE INDEX "customers_cpf_key" ON "customers"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "customers_email_key" ON "customers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "customers_cnh_code_key" ON "customers"("cnh_code");

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_chassi_key" ON "vehicles"("chassi");

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_plate_key" ON "vehicles"("plate");

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_crlv_document_key" ON "vehicles"("crlv_document");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_privileges_id_fkey" FOREIGN KEY ("privileges_id") REFERENCES "privileges"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customers" ADD CONSTRAINT "customers_honors_id_fkey" FOREIGN KEY ("honors_id") REFERENCES "honors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customers" ADD CONSTRAINT "customers_nationalities_id_fkey" FOREIGN KEY ("nationalities_id") REFERENCES "nationalities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reserves" ADD CONSTRAINT "reserves_customers_id_fkey" FOREIGN KEY ("customers_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reserves" ADD CONSTRAINT "reserves_vehicles_id_fkey" FOREIGN KEY ("vehicles_id") REFERENCES "vehicles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vehicles" ADD CONSTRAINT "vehicles_units_id_fkey" FOREIGN KEY ("units_id") REFERENCES "units"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vehicles" ADD CONSTRAINT "vehicles_categories_id_fkey" FOREIGN KEY ("categories_id") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vehicles" ADD CONSTRAINT "vehicles_groups_id_fkey" FOREIGN KEY ("groups_id") REFERENCES "groups"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_prices_id_fkey" FOREIGN KEY ("prices_id") REFERENCES "prices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "units" ADD CONSTRAINT "units_cities_id_fkey" FOREIGN KEY ("cities_id") REFERENCES "cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cities" ADD CONSTRAINT "cities_states_id_fkey" FOREIGN KEY ("states_id") REFERENCES "states"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
