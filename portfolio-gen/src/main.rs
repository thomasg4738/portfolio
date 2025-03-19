//! # Portfolio contract generator
//!
//! To generate portfolio{coins}.
//!
//! for exmaple (coins = 2):
//!
//! ```move
//! module portfolio::portfolio2;
//!
//! use portfolio::asset::{Asset, new_asset};
//! use sui::coin::{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn};
//! use sui::url::Url;
//!
//! public struct Portfolio2<phantom T, phantom C0, phantom C1> has key, store {
//!     id: UID,
//!     treasury_cap: TreasuryCap<T>,
//!     asset0: Asset<C0>,
//!     asset1: Asset<C1>,
//! }
//!
//! public fun create_portfolio2<T: drop, C0, C1>(
//!     witness: T,
//!     amount0: u64,
//!     amount1: u64,
//!     decimals: u8,
//!     name: vector<u8>,
//!     symbol: vector<u8>,
//!     description: vector<u8>,
//!     icon_url: Option<Url>,
//!     ctx: &mut TxContext,
//! ): (Portfolio2<T, C0, C1>, CoinMetadata<T>) {
//!     let (treasury_cap, c) = create_currency(
//!         witness,
//!         decimals,
//!         symbol,
//!         name,
//!         description,
//!         icon_url,
//!         ctx
//!     );
//!     (
//!         Portfolio2 {
//!             id: object::new(ctx),
//!             treasury_cap,
//!             asset0: new_asset<C0>(amount0),
//!             asset1: new_asset<C1>(amount1),
//!         },
//!         c,
//!     )
//! }
//!
//! public fun mint_portfolio2<T: drop, C0, C1>(
//!     input_coin0: Coin<C0>,
//!     input_coin1: Coin<C1>,
//!     portfolio: &mut Portfolio2<T, C0, C1>,
//!     amount: u64,
//!     ctx: &mut TxContext,
//! ): Coin<T> {
//!     portfolio.asset0.deposit(input_coin0, amount);
//!     portfolio.asset1.deposit(input_coin1, amount);
//!
//!     mint(&mut portfolio.treasury_cap, amount, ctx)
//! }
//!
//! public fun burn_portfolio2<T: drop, C0, C1>(
//!     portfolio_coin: Coin<T>,
//!     portfolio: &mut Portfolio2<T, C0, C1>,
//!     ctx: &mut TxContext,
//! ): (Coin<C0>, Coin<C1>) {
//!     let amount = portfolio_coin.value();
//!     burn(&mut portfolio.treasury_cap, portfolio_coin);
//!
//!     (
//!         portfolio.asset0.withdraw(amount, ctx),
//!         portfolio.asset1.withdraw(amount, ctx),
//!     )
//! }
//! ```
//!

use std::fmt::Write;

fn main() -> anyhow::Result<()> {
    let Some(coins) = std::env::args().skip(1).nth(0) else {
        return Err(anyhow::anyhow!("Please provide the number of coins"));
    };

    let coins = coins.parse::<usize>()?;
    let code = generate(coins)?;
    println!("{}", code);
    Ok(())
}

fn generate(coins: usize) -> anyhow::Result<String> {
    let mut builder = String::new();
    writeln!(&mut builder, "module portfolio::portfolio{coins};")?;
    writeln!(&mut builder)?;
    writeln!(&mut builder, "use portfolio::asset::{{Asset, new_asset}};")?;
    writeln!(
        &mut builder,
        "use sui::coin::{{TreasuryCap, CoinMetadata, create_currency, Coin, mint, burn}};"
    )?;
    writeln!(&mut builder, "use sui::url::Url;")?;
    writeln!(&mut builder)?;
    write!(&mut builder, "public struct Portfolio{coins}<phantom T")?;
    for i in 0..coins {
        write!(&mut builder, ", phantom C{i}")?;
    }
    writeln!(&mut builder, "> has key, store {{")?;
    writeln!(&mut builder, "    id: UID,")?;
    writeln!(&mut builder, "    treasury_cap: TreasuryCap<T>,")?;
    for i in 0..coins {
        writeln!(&mut builder, "    asset{i}: Asset<C{i}>,")?;
    }
    writeln!(&mut builder, "}}")?;
    writeln!(&mut builder)?;

    write!(&mut builder, "public fun create_portfolio{}<T: drop", coins)?;
    for i in 0..coins {
        write!(&mut builder, ", C{}", i)?;
    }
    writeln!(&mut builder, ">(")?;
    writeln!(&mut builder, "    witness: T,")?;
    for i in 0..coins {
        writeln!(&mut builder, "    amount{}: u64,", i)?;
    }
    writeln!(&mut builder, "    decimals: u8,")?;
    writeln!(&mut builder, "    name: vector<u8>,")?;
    writeln!(&mut builder, "    symbol: vector<u8>,")?;
    writeln!(&mut builder, "    description: vector<u8>,")?;
    writeln!(&mut builder, "    icon_url: Option<Url>,")?;
    writeln!(&mut builder, "    ctx: &mut TxContext,")?;
    write!(&mut builder, "): (Portfolio{coins}<T")?;
    for i in 0..coins {
        write!(&mut builder, ", C{}", i)?;
    }
    writeln!(&mut builder, ">, CoinMetadata<T>) {{")?;
    writeln!(&mut builder, "    let (treasury_cap, c) = create_currency(")?;
    writeln!(&mut builder, "        witness,")?;
    writeln!(&mut builder, "        decimals,")?;
    writeln!(&mut builder, "        symbol,")?;
    writeln!(&mut builder, "        name,")?;
    writeln!(&mut builder, "        description,")?;
    writeln!(&mut builder, "        icon_url,")?;
    writeln!(&mut builder, "        ctx")?;
    writeln!(&mut builder, "    );")?;
    writeln!(&mut builder, "    (")?;
    writeln!(&mut builder, "        Portfolio{coins} {{")?;
    writeln!(&mut builder, "            id: object::new(ctx),")?;
    writeln!(&mut builder, "            treasury_cap,")?;
    for i in 0..coins {
        writeln!(
            &mut builder,
            "            asset{i}: new_asset<C{i}>(amount{i}),"
        )?;
    }
    writeln!(&mut builder, "        }},")?;
    writeln!(&mut builder, "        c,")?;
    writeln!(&mut builder, "    )")?;
    writeln!(&mut builder, "}}")?;
    writeln!(&mut builder)?;

    write!(&mut builder, "public fun mint_portfolio{coins}<T: drop")?;
    for i in 0..coins {
        write!(&mut builder, ", C{i}")?;
    }
    writeln!(&mut builder, ">(")?;
    for i in 0..coins {
        writeln!(&mut builder, "    input_coin{i}: Coin<C{i}>,")?;
    }
    write!(&mut builder, "    portfolio: &mut Portfolio{coins}<T")?;
    for i in 0..coins {
        write!(&mut builder, ", C{i}")?;
    }
    writeln!(&mut builder, ">,")?;
    writeln!(&mut builder, "    amount: u64,")?;
    writeln!(&mut builder, "    ctx: &mut TxContext,")?;
    writeln!(&mut builder, "): Coin<T> {{")?;
    for i in 0..coins {
        writeln!(
            &mut builder,
            "    portfolio.asset{i}.deposit(input_coin{i}, amount);"
        )?;
    }
    writeln!(&mut builder,)?;
    writeln!(
        &mut builder,
        "    mint(&mut portfolio.treasury_cap, amount, ctx)"
    )?;
    writeln!(&mut builder, "}}")?;
    writeln!(&mut builder)?;

    write!(&mut builder, "public fun burn_portfolio{coins}<T: drop")?;
    for i in 0..coins {
        write!(&mut builder, ", C{i}")?;
    }
    writeln!(&mut builder, ">(")?;
    writeln!(&mut builder, "    portfolio_coin: Coin<T>,")?;
    write!(&mut builder, "    portfolio: &mut Portfolio{coins}<T")?;
    for i in 0..coins {
        write!(&mut builder, ", C{i}")?;
    }
    writeln!(&mut builder, ">,")?;
    writeln!(&mut builder, "    ctx: &mut TxContext,")?;
    write!(&mut builder, "): (")?;
    for i in 0..coins {
        if i == coins - 1 {
            write!(&mut builder, "Coin<C{i}>")?;
        } else {
            write!(&mut builder, "Coin<C{i}>, ")?;
        }
    }
    writeln!(&mut builder, ") {{")?;
    writeln!(&mut builder, "    let amount = portfolio_coin.value();")?;
    writeln!(
        &mut builder,
        "    burn(&mut portfolio.treasury_cap, portfolio_coin);"
    )?;
    writeln!(&mut builder)?;
    writeln!(&mut builder, "    (")?;
    for i in 0..coins {
        writeln!(
            &mut builder,
            "        portfolio.asset{i}.withdraw(amount, ctx),"
        )?;
    }
    writeln!(&mut builder, "    )")?;
    writeln!(&mut builder, "}}")?;

    Ok(builder)
}
