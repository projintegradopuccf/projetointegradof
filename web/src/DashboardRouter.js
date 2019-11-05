import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";

import Products from "./Pages/Products";
import Customers from "./Pages/Customers";
import OrderItens from "./Pages/OrderItens";
import Geolocations from "./Pages/Geolocations";
import Orders from "./Pages/Orders";
import Payments from "./Pages/Payments";
import Reviews from "./Pages/Reviews";
import Sellers from "./Pages/Sellers";

export default class DashboardRouter extends React.Component {
  render() {
    return (
      <div>
        <BrowserRouter>
          <Switch>
            <Route path="/dashboard/customers" component={Customers} exact />
            <Route path="/dashboard/geolocation" component={Geolocations} exact />
            <Route path="/dashboard/order-itens" component={OrderItens} exact />
            <Route path="/dashboard/orders" component={Orders} exact />
            <Route path="/dashboard/payments" component={Payments} exact />
            <Route path="/dashboard/reviews" component={Reviews} exact />
            <Route path="/dashboard/products" component={Products} exact />
            <Route path="/dashboard/sellers" component={Sellers} exact />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}
