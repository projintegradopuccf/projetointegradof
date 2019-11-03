import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";

import Products from "./Pages/Products";
import Customers from "./Pages/Customers";

export default class DashboardRouter extends React.Component {
  render() {
    return (
      <div>
        <BrowserRouter>
          <Switch>
            <Route path="/dashboard/customers" component={Customers} exact />
            <Route path="/dashboard/products" component={Products} exact />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}
