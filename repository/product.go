package repository

import (
	"database/sql"
	"devfood/entity"
)

type ModelProduct struct {
	db *sql.DB
}

func ProductRepository(db *sql.DB) *ModelProduct {
	return &ModelProduct{db}
}

func (repository ModelProduct) New(model entity.Product) error {
	_, err := repository.db.Exec("INSERT INTO product (codproduct, descproduct, price) VALUES ($1, $2, $3)",
		model.CodProduct, model.DescProduct, model.Price)

	if err != nil {
		return err
	}
	return nil
}

func (repository ModelProduct) QueryID(productid string) (entity.Product, error) {

	var productEntity entity.Product
	err := repository.db.QueryRow("SELECT * FROM product").Scan(&productEntity.Id)

	switch {
	case err == sql.ErrNoRows || err != nil:
		return entity.Product{}, err
	default:
		return productEntity, nil
	}

	// if dbRows. {
	// 	var model entidade.SubGrupoProduto
	// 	if err := dbRows.Scan(&model.CdSubGruProd, &model.CdGruProd, &model.DsSubGruProd); err != nil {
	// 		return nil, err
	// 	}
	// 	listaArray = append(listaArray, model)
	// }
}
