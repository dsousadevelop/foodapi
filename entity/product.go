package entity

type Product struct {
	Id          uint64 `json:"id"`
	CodProduct  uint64 `json:"codproduct"`
	DescProduct uint64 `json:"descproduct"`
	Price       string `json:"price"`
}
