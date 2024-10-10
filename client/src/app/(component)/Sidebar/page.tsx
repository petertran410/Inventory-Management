"use client";

import React from "react";
import { Menu, Copyright } from "lucide-react";
const Sidebar = () => {
  return (
    <div>
      {/* Top LOGO */}
      <div className="flex justify-between gap-3 md:justify-normal items-center pt-8">
        <div>Logo</div>
        <h1 className="font-extrabold text-2xl">Ngoc Nhan</h1>
        <button
          className="md-hidden px-3 py-3 bg-gray-100 rounded-full hover:bg-blue-100"
          onClick={() => {}}>
          <Menu className="w-4 h-4" />
        </button>
      </div>

      {/* Link */}
      <div className="flex-grow mt-8">{/* Link here */}</div>

      {/* Footer */}
      <div className=" flex text-center text-gray-500">
        <Copyright className="text-sm pb-2" />
        <div>2024 Tran Ngoc Nhan</div>
      </div>
    </div>
  );
};

export default Sidebar;
