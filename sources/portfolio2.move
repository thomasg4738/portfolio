module portfolio::portfolio2;

use portfolio::asset::{Asset, new_asset};
use sui::coin::{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn};
use sui::url::Url;

public struct Portfolio2<phantom T, phantom C0, phantom C1> has key, store {
    id: UID,
    treasury_cap: TreasuryCap<T>,
    asset0: Asset<C0>,
    asset1: Asset<C1>,
}

public fun create_portfolio2<T: drop, C0, C1>(
    witness: T,
    amount0: u64,
    amount1: u64,
    decimals: u8,
    name: vector<u8>,
    symbol: vector<u8>,
    description: vector<u8>,
    icon_url: Option<Url>,
    ctx: &mut TxContext,
): (Portfolio2<T, C0, C1>, CoinMetadata<T>) {
    let (treasury_cap, c) = create_currency(
        witness,
        decimals,
        symbol,
        name,
        description,
        icon_url,
        ctx
    );
    (
        Portfolio2 {
            id: object::new(ctx),
            treasury_cap,
            asset0: new_asset<C0>(amount0),
            asset1: new_asset<C1>(amount1),
        },
        c,
    )
}

public fun mint_portfolio2<T: drop, C0, C1>(
    input_coin0: Coin<C0>,
    input_coin1: Coin<C1>,
    portfolio: &mut Portfolio2<T, C0, C1>,
    amount: u64,
    ctx: &mut TxContext,
): Coin<T> {
    portfolio.asset0.deposit(input_coin0, amount);
    portfolio.asset1.deposit(input_coin1, amount);

    mint(&mut portfolio.treasury_cap, amount, ctx)
}

public fun burn_portfolio2<T: drop, C0, C1>(
    portfolio_coin: Coin<T>,
    portfolio: &mut Portfolio2<T, C0, C1>,
    ctx: &mut TxContext,
): (Coin<C0>, Coin<C1>) {
    let amount = portfolio_coin.value();
    burn(&mut portfolio.treasury_cap, portfolio_coin);

    (
        portfolio.asset0.withdraw(amount, ctx),
        portfolio.asset1.withdraw(amount, ctx),
    )
}

