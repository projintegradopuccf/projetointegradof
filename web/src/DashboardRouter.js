import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";

import Products from "./Pages/Products";
import Customers from "./Pages/Customers";
import OrderItens from "./Pages/OrderItens";

export default class DashboardRouter extends React.Component {
  render() {
    return (
      <div>
        <BrowserRouter>
          <Switch>
            <Route path="/dashboard/customers" component={Customers} exact />
            <Route path="/dashboard/geolocation" component={Customers} exact />
            <Route path="/dashboard/order-itens" component={OrderItens} exact />
            <Route path="/dashboard/orders" component={Customers} exact />
            <Route path="/dashboard/payments" component={Customers} exact />
            <Route path="/dashboard/reviews" component={Customers} exact />
            <Route path="/dashboard/products" component={Products} exact />
            <Route path="/dashboard/sellers" component={Customers} exact />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}
