package database

import "database/sql"

func Conectar() (*sql.DB, error) {
	connStr := "postgres://postgres:v83ay74@localhost:5480/dbecommerce?sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		return nil, err
	}
	err = db.Ping()
	if err != nil {
		return nil, err
	}
	return db, nil
}
