export interface Account {
  ime: string;
  prezime: string;
  type: eAccountType;
  id: number
}

export enum eAccountType {
  profesor = 1,
  student = 2
}
