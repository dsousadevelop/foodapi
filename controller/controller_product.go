package controller

import (
	"devfood/database"
	"devfood/entity"
	"devfood/repository"
	"devfood/rest"
	"encoding/json"
	"io"
	"net/http"

	"github.com/gin-gonic/gin"
)

func ProductGET(c *gin.Context) {

	corpoRequest, err := io.ReadAll(c.Request.Body)
	if err != nil {
		rest.Erro(c, http.StatusUnprocessableEntity, err)
		return
	}
	db, err := database.Conectar()
	if err != nil {
		rest.Erro(c, http.StatusBadRequest, err)
		return
	}
	defer db.Close()

	productstring := c.Query("productid")

	_repository := repository.ProductRepository(db)

	err = _repository.New(model)
	if err != nil {
		rest.Erro(c, http.StatusBadRequest, err)
		return
	}
	rest.JSON(c, http.StatusCreated, nil)
}

func ProductPOST(c *gin.Context) {

	corpoRequest, err := io.ReadAll(c.Request.Body)
	if err != nil {
		rest.Erro(c, http.StatusUnprocessableEntity, err)
		return
	}
	db, err := database.Conectar()
	if err != nil {
		rest.Erro(c, http.StatusBadRequest, err)
		return
	}
	defer db.Close()

	var model entity.Product

	if err = json.Unmarshal(corpoRequest, &model); err != nil {
		rest.Erro(c, http.StatusBadRequest, err)
		return
	}

	_repository := repository.ProductRepository(db)

	err = _repository.New(model)
	if err != nil {
		rest.Erro(c, http.StatusBadRequest, err)
		return
	}
	rest.JSON(c, http.StatusCreated, nil)
}
