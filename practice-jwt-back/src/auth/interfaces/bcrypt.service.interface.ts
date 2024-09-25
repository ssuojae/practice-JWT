export abstract class IbcryptService {
    abstract hash(password: string): Promise<string>;
    abstract compare(password: string, hashedPassword: string): Promise<boolean>;
}