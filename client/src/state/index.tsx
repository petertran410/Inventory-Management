import { createSlice, PayloadAction } from "@reduxjs/toolkit";

export interface InitialStateTypes {
  isSidebarCollapesed: boolean;
  isDarkMode: boolean;
}

const initialState: InitialStateTypes = {
  isSidebarCollapesed: false,
  isDarkMode: false,
};
