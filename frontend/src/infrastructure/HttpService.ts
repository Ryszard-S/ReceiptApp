import Fetch from "./fetchInstance";

export interface BaseHttpService {
  token: string;
  get<Response>(path: string, options?: RequestInit): Promise<Response>;
  post<Response>(path: string, options?: RequestInit): Promise<Response>;
  patch<Response>(path: string, options?: RequestInit): Promise<Response>;
  delete<Response>(path: string, options?: RequestInit): Promise<Response>;
}

class HttpService {
  http: BaseHttpService;

  constructor() {
    this.http = new Fetch();
  }

  setToken = (token: string) => {
    this.http.token = token;
  };

  // TODO change from any to Task type
  // getTask = (taskId: string): Promise<any> => this.http.get(`${TASK}/${taskId}`)
  // postDashboard = (): Promise<any> => this.http.post(`${DASHBOARD}/`)
}

export default new HttpService();
