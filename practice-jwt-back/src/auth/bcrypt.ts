import * as bcrypt from 'bcryptjs';

export const Bcrypt = {
  hash: async (password: string) => {
    return await bcrypt.hash(password, 10);
  },

  compare: async (password: string, hashedPassword: string) => {
    return await bcrypt.compare(password, hashedPassword);
  },
};
