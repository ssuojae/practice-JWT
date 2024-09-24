export abstract class IJwtStrategy {
    abstract validateToken(token: string): Promise<{ id: string; email: string }>;
}
