import { render, screen, waitFor } from "@testing-library/react";
import Home from "../pages/index";
import axios from "axios";

// Mock axios
jest.mock("axios");

describe("Homepage UI Tests", () => {
  beforeEach(() => {
    axios.get.mockImplementation((url) => {
      if (url.includes("/api/health")) {
        return Promise.resolve({ data: { status: "healthy", message: "Backend is running successfully" } });
      }
      if (url.includes("/api/message")) {
        return Promise.resolve({ data: { message: "You've successfully integrated the backend!" } });
      }
    });
  });

  it("renders the status label", async () => {
    render(<Home />);
    const status = await waitFor(() => screen.getByText(/Status/i));
    expect(status).toBeInTheDocument();
  });

  it("renders the integration message label", async () => {
    render(<Home />);
    const message = await waitFor(() => screen.getByText(/integrated/i));
    expect(message).toBeInTheDocument();
  });
});

