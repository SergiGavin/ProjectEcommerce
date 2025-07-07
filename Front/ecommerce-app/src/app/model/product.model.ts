
//Debe coincidir nombre variable con nombre del json.
export interface Product{
    id_product: number;
    product_name: string;
    description: string;
    price: number;
    stock_quantity: number;
    category: string;
    creation_date: Date;
    update_date: Date;
    discount: number;
    taxes: number;
    product_image: string;
    availability: boolean;
    technical_specifications: string;
    sales: number;
    productOrders: number[];
}

