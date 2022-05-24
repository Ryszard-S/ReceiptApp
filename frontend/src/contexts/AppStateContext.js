import React from "react";

const appDefaultValue = {
  token: "",
};

export const AppContext =
  React.createContext [appDefaultValue, () => {}];
