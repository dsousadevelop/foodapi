package rest

import "github.com/gin-gonic/gin"

func JSON(c *gin.Context, statusCode int, dados interface{}) {
	if dados != nil {
		c.JSON(statusCode, dados)
		return
	}
	c.Status(statusCode)
}

func Erro(c *gin.Context, statusCode int, erro error) {
	JSON(c, statusCode, struct {
		Erro string `json:"erro"`
	}{
		Erro: erro.Error(),
	})
}
